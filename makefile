MAIN = Main
SRCS = $(wildcard scala/*.scala)
BUILDDIR = build
S = scala
SC = scalac
CP = ./$(BUILDDIR)/scala:./lib/spinalhdl-core_2.11-0.10.7.jar:./lib/spinalhdl-lib_2.11-0.10.7.jar:./lib/scopt_2.11-3.4.0.jar


compile:
	@mkdir -p $(BUILDDIR)/scala/
	$(SC) -cp "$(CP)" -d $(BUILDDIR)/scala $(SRCS)

run: compile
	$(S)  -cp "$(CP)" $(MAIN)
  
clean:
	@rm -rf $(BUILDDIR)