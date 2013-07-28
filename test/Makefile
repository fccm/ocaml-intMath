OCAML = ocaml
LIB_DIR = +site-lib/intMath
LIB_INC = -I $(LIB_DIR)

.PHONY: test
test:
	$(OCAML) $(LIB_INC) IntMath.cma test.ml 0
	$(OCAML) $(LIB_INC) IntMath.cma test.ml 10
	$(OCAML) $(LIB_INC) IntMath.cma test.ml 20
	$(OCAML) $(LIB_INC) IntMath.cma test.ml 30
	$(OCAML) $(LIB_INC) IntMath.cma test.ml 90
	$(OCAML) $(LIB_INC) IntMath.cma test.ml 180
	$(OCAML) $(LIB_INC) IntMath.cma test.ml 270
	$(OCAML) $(LIB_INC) IntMath.cma test.ml 350
	$(OCAML) $(LIB_INC) IntMath.cma test.ml 360
	$(OCAML) $(LIB_INC) IntMath.cma test.ml 370
	$(OCAML) $(LIB_INC) IntMath.cma test.ml -10
	$(OCAML) $(LIB_INC) IntMath.cma test.ml -370

