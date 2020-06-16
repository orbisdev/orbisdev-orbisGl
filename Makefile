ifndef ORBISDEV
$(error ORBISDEV, is not set)
endif

target := ps4_lib
OutPath := lib
TargetFile := liborbisGl
AllTarget = $(OutPath)/$(TargetFile).a 

include $(ORBISDEV)/make/ps4sdklib.mk
CompilerFlags += -DHAVE_CONFIG_H -D_U_="__attribute__((unused))" -DNDEBUG -D__PS4__ -D_BSD_SOURCE -D__ORBIS__
CompilerFlagsCpp += -DHAVE_CONFIG_H -D_U_="__attribute__((unused))" -DNDEBUG -D__PS4__ -D_BSD_SOURCE -D__ORBIS__
IncludePath += -I$(ORBISDEV)/usr/include 

$(OutPath)/$(TargetFile).a: $(ObjectFiles)
	$(dirp)
	$(archive)

install:
	@cp $(OutPath)/$(TargetFile).a $(ORBISDEV)/usr/lib
	@cp include/orbisGl.h $(ORBISDEV)/usr/include/orbis
	@echo "$(TargetFile) Installed!"

