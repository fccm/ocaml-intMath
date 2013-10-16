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
lib: intMath.cma
opt: intMath.cmxa

intMath.cmo: intMath.cmi tables.cmo
intMath.cmx: intMath.cmi tables.cmx

.PHONY: tables
tables: tables.ml
tables.ml: gen_tables.ml
	$(OCAML) $< > $@

.SECONDARY:

%.cmi: %.mli
	$(OCAMLC) -c $<

%.cmo: %.ml %.cmi
	$(OCAMLC) -c $<
%.cmo: %.ml
	$(OCAMLC) -c $<

%.cmx: %.ml %.cmi
	$(OCAMLOPT) -c $<
%.cmx: %.ml
	$(OCAMLOPT) -c $<

intMath.cma: tables.cmo intMath.cmo
	$(OCAMLC) -a -o $@ $^

intMath.cmxa: tables.cmx intMath.cmx
	$(OCAMLOPT) -a -o $@ $^

intMath.cmxs: intMath.cmxa
	$(OCAMLOPT) -shared -linkall -o $@ $<

META: META.in
	sed -e 's/@VERSION@/$(VERSION)/g' $< > $@

.PHONY: findinstall
findinstall: META intMath.cma
	$(OCAMLFIND) install intMath META *.cm[iax] *.cmx[as] *.mli *.a

.PHONY: finduninstall
finduninstall:
	$(OCAMLFIND) remove intMath

.PHONY: edit
edit:
	$(EDITOR) intMath.ml intMath.mli

.PHONY: doc
doc:
	$(MKDIR) $(DOC_DIR)
	$(OCAMLDOC) -d $(DOC_DIR) -html intMath.mli

.PHONY: cleandoc
cleandoc:
	$(RM) -r $(DOC_DIR)

.PHONY: clean
clean:
	$(RM) *.[oa] *.cm[ioxa] *.cmx[as] *.opt *.exe *.byte

