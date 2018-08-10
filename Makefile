.PHONY: me a an some clear_dishes recipes

me:
	@touch .me
a:
	@touch .a
some an: a
	@true

%:
	@rm -f pyfile.py
	@echo 'import glob' >> pyfile.py
	@echo 'import random' >> pyfile.py
	@echo 'import os' >> pyfile.py
	@echo 'import sys' >> pyfile.py
	@echo 'from fuzzywuzzy import process' >> pyfile.py
	@echo 'e = os.path.exists(".a") and os.path.exists(".me")' >> pyfile.py
	@echo 'a = sys.argv[1]' >> pyfile.py
	@echo 'if a in ("random", "something"): a = "*"' >> pyfile.py
	@echo 'if not glob.glob(a+"_recipe_*"): a = process.extractOne(a, [b[:b.index("_recipe_")] for b in glob.iglob("*_recipe_*")])[0]' >> pyfile.py
	@echo 'if e and glob.glob(a + "_recipe_*"): print(open(random.choice(glob.glob(a + "_recipe_*"))).read())' >> pyfile.py
	@echo 'else: sys.exit(1)' >> pyfile.py
ifeq ($(shell if touch / 2> /dev/null; then id -u; fi),0)
	@pip install fuzzywuzzy python-Levenshtein > /dev/null 2>&1
	-@python pyfile.py $@ > .temp; if test $$? -eq 1; then (echo 'No.'); else (echo "Okay."; echo "$@" >> dirty_dishes; mv .temp $@; cat $@;); fi

else
	@echo "What? Make it yourself."
endif
	@rm -f pyfile.py .a .me .temp


clear_dishes:
	@rm -f pyfile.py .me .a .temp $$(echo 'print(open("dirty_dishes").read().replace("\\n", " "))' | python 2>/dev/null) dirty_dishes

recipes:
	@echo 'import glob; print("\\n".join(sorted(glob.glob("*_recipe_*"))))' | python
