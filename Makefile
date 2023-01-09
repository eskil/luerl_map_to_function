all:
	mix deps.get
	mix deps.compile
	mix escript.build

run:
	./luerl_map_to_function

clean:
	mix deps.clean --all
	mix clean
	rm -rf _build/
	rm -f luerlex

edit:
	emacs `find lib/ config/ test/-type f -iname "*.ex" -o -iname "*.exs"` mix.exs
