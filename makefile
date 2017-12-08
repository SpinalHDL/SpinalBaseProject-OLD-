MAIN = Main
SRCS = $(wildcard scala/*.scala)
BUILDDIR = build
S = scala
SC = scalac
CP = ./$(BUILDDIR)/scala:./lib/spinalhdl-core_2.11-0.11.5.jar:./lib/spinalhdl-lib_2.11-0.11.5.jar:./lib/scopt_2.11-3.4.0.jar:./lib/commons-io-2.4.jar

run: compile
	$(S)  -cp "$(CP)" $(MAIN)

compile:
	@mkdir -p $(BUILDDIR)/scala/
	$(SC) -cp "$(CP)" -d $(BUILDDIR)/scala $(SRCS)
  
clean:
	@rm -rf $(BUILDDIR)
  