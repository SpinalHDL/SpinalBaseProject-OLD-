package workshop.stream

import spinal.core._
import spinal.lib._


case class MemoryWrite() extends Bundle{
  val address = UInt(8 bits)
  val data    = Bits(32 bits)
}

case class StreamUnit() extends Component{
  val io = new Bundle{
    val memWrite = slave  Flow(MemoryWrite())
    val cmdA     = slave  Stream(UInt(8 bits))
    val cmdB     = slave  Stream(Bits(32 bits))
    val rsp      = master Stream(Bits(32 bits))
  }

  val mem = Mem(Bits(32 bits),1 << 8)
  mem.write(
    enable = io.memWrite.valid,
    address = io.memWrite.address,
    data = io.memWrite.data
  )

  //*******  MemReadStage **************
  //MemReadStage declarations
  val memReadValid = RegInit(False)
  val memReadReady = Bool

  //MemReadStage handshake
  when(memReadReady){
    memReadValid := False
  }
  when(!memReadValid || memReadReady){
    memReadValid := io.cmdA.valid
  }
  io.cmdA.ready := !memReadValid || memReadReady

  //MemReadStage memory access
  val memReadData = mem.readSync(
    enable = io.cmdA.fire,
    address = io.cmdA.payload
  )


  //******** Join stage **************
  // Join arbitration
  io.rsp.valid := memReadValid && io.cmdB.valid
  memReadReady := io.rsp.fire
  io.cmdB.ready := io.rsp.fire

  // Join datapath
  io.rsp.payload := memReadData ^ io.cmdB.payload
}
