OCAML = ocaml
LIB_DIR = +intMath
LIB_INC = -I $(LIB_DIR)

.PHONY: test
test: \
  test_trigo \
  test_inv

.PHONY: test_trigo
test_trigo:
	$(OCAML) $(LIB_INC) IntMath.cma test.ml -trigo 0
	$(OCAML) $(LIB_INC) IntMath.cma test.ml -trigo 10
	$(OCAML) $(LIB_INC) IntMath.cma test.ml -trigo 20
	$(OCAML) $(LIB_INC) IntMath.cma test.ml -trigo 30
	$(OCAML) $(LIB_INC) IntMath.cma test.ml -trigo 90
	$(OCAML) $(LIB_INC) IntMath.cma test.ml -trigo 180
	$(OCAML) $(LIB_INC) IntMath.cma test.ml -trigo 270
	$(OCAML) $(LIB_INC) IntMath.cma test.ml -trigo 350
	$(OCAML) $(LIB_INC) IntMath.cma test.ml -trigo 360
	$(OCAML) $(LIB_INC) IntMath.cma test.ml -trigo 370
	$(OCAML) $(LIB_INC) IntMath.cma test.ml -trigo -10
	$(OCAML) $(LIB_INC) IntMath.cma test.ml -trigo -370

.PHONY: test_inv
test_inv:
	$(OCAML) $(LIB_INC) IntMath.cma test.ml -inv-trigo 0.866
	$(OCAML) $(LIB_INC) IntMath.cma test.ml -inv-trigo 0.707
	$(OCAML) $(LIB_INC) IntMath.cma test.ml -inv-trigo 0.342

