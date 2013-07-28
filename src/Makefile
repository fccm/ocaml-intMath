OCAML := ocaml
OCAMLC := ocamlc -g
OCAMLOPT := ocamlopt -g
OCAMLDOC := ocamldoc
OCAMLFIND := ocamlfind
VERSION := $(shell date --iso)
EDITOR := vim

OCAML_DIR := $(shell $(OCAMLC) -where)
DOC_DIR := doc
MKDIR := mkdir -p

.PHONY: all lib opt
all: lib opt
lib: IntMath.cma
opt: IntMath.cmxa

IntMath.cmo: IntMath.cmi tables.cmo
IntMath.cmx: IntMath.cmi tables.cmx

tables.ml:
	$(OCAML) gen_tables.ml > $@

.SECONDARY:

%.cmi: %.mli
	$(OCAMLC) -c -o $@ $<

%.cmo: %.ml %.cmi
	$(OCAMLC) -c $<
%.cmo: %.ml
	$(OCAMLC) -c $<

%.cmx: %.ml %.cmi
	$(OCAMLOPT) -c $<
%.cmx: %.ml
	$(OCAMLOPT) -c $<

IntMath.cma: tables.cmo IntMath.cmo
	$(OCAMLC) -a -o $@ $^

IntMath.cmxa: tables.cmx IntMath.cmx
	$(OCAMLOPT) -a -o $@ $^

IntMath.cmxs: IntMath.cmxa
	$(OCAMLOPT) -shared -linkall -o $@ $<

META: META.in
	sed -e 's/@VERSION@/$(VERSION)/g' $< > $@

.PHONY: findinstall
findinstall: META IntMath.cma
	$(OCAMLFIND) install IntMath META *.cm[iax] *.cmx[as] *.mli *.a

.PHONY: finduninstall
finduninstall:
	$(OCAMLFIND) remove IntMath

.PHONY: edit
edit:
	$(EDITOR) IntMath.ml IntMath.mli

.PHONY: doc
doc:
	$(MKDIR) $(DOC_DIR)
	$(OCAMLDOC) -d $(DOC_DIR) -html IntMath.mli

.PHONY: cleandoc
cleandoc:
	$(RM) -r $(DOC_DIR)

.PHONY: clean
clean:
	$(RM) *.[oa] *.cm[ioxa] *.cmx[as] *.opt *.exe *.byte

