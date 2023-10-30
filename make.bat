set rom_version=1.0.1
set rom_name=whirlo_prac_v%rom_version%.sfc

IF NOT EXIST rom_output mkdir rom_output
del /q rom_output
copy rom_source\source.sfc rom_output\%rom_name%
python make_characters_jp_bin.py
tools\asar\asar.exe --no-title-check --fix-checksum=off src/main.asm rom_output\%rom_name%