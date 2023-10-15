set rom_version=0.1beta
set rom_name=whirlo_prac_v%rom_version%.sfc

IF NOT EXIST rom_output mkdir rom_output
del /q output
copy rom_source\source.sfc rom_output\%rom_name%
tools\asar\asar.exe --no-title-check src/main.asm rom_output\%rom_name%