ifndef PS4SDK
$(error PS4SDK, is not set)
endif

target := ps4_lib
OutPath := lib
TargetFile := liborbisGl
AllTarget = $(OutPath)/$(TargetFile).a 

include $(PS4SDK)/make/ps4sdklib.mk
CompilerFlags += -DHAVE_CONFIG_H -D_U_="__attribute__((unused))" -DNDEBUG -D__PS4__ -D_BSD_SOURCE -D__ORBIS__
CompilerFlagsCpp += -DHAVE_CONFIG_H -D_U_="__attribute__((unused))" -DNDEBUG -D__PS4__ -D_BSD_SOURCE -D__ORBIS__
CompilerFlagsstub += -DHAVE_CONFIG_H -D_U_="__attribute__((unused))" -DNDEBUG -D__PS4__ -D_BSD_SOURCE -D__ORBIS__
CompilerFlagsCppstub += -DHAVE_CONFIG_H -D_U_="__attribute__((unused))" -DNDEBUG -D__PS4__ -D_BSD_SOURCE -D__ORBIS__
#Libraries = -lkernel_stub -lc -lSceNet_stub -lSceLibcInternail_stub -lScePad_stub -lSceUserService_stub -lScePigletv2VSH_stub
IncludePath += -I$(PS4SDK)/include -Iinclude/nfsc 


$(OutPath)/$(TargetFile).a: $(ObjectFiles)
	$(dirp)
	$(archive)

install:
	@cp $(OutPath)/$(TargetFile).a $(PS4SDK)/lib
	@cp include/orbisGl.h $(PS4SDK)/include/orbis
	@echo "$(TargetFile) Installed!"

