.PHONY: unpack clean

unpack:
	@find . -name '*.zip' -print0 | while IFS= read -r -d '' zipfile; do \
		echo "Unzipping $$zipfile"; \
		(cd "$$(dirname "$$zipfile")" && unzip -o "$$(basename "$$zipfile")"); \
	done

clean:
	@find . -name '*.zip' -print0 | while IFS= read -r -d '' zipfile; do \
		echo "Cleaning files from $$zipfile"; \
		(cd "$$(dirname "$$zipfile")" && unzip -Z1 "$$(basename "$$zipfile")" | xargs -I {} rm -f "{}"); \
	done
