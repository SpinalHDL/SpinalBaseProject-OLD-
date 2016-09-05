import spinal.core._
import spinal.lib._

class TopLevel extends Component{
  val io = new Bundle{
    val a,b = in UInt(4 bits)
    val result = out UInt(4 bits)
  }
  io.result := RegNext(io.a + io.b)
}

object Main{
  def main(args: Array[String]) {
    SpinalVhdl(new TopLevel)
    //SpinalVerilog(new TopLevel)
  } 
}