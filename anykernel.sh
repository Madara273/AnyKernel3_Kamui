### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers
# kamui changes by madara

### AnyKernel setup
# global properties
properties() { '
kernel.string=### kamui kernel for OnePlus 9/Pro ###
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=OnePlus9Pro
device.name2=lemonadep
device.name3=OnePlus9ProTMO
device.name4=lemonadept
device.name5=OnePlus9
device.name6=lemonade
device.name7=OnePlus9TMO
device.name8=lemonadet
device.name9=OnePlus9VZW
device.name10=lemonadev
supported.versions=14
'; } # end properties


## trim partitions
fstrim -v /data;

### AnyKernel install
## boot files attributes
boot_attributes() {
set_perm_recursive 0 0 755 644 $RAMDISK/overlay.d/*;
set_perm_recursive 0 0 750 750 $RAMDISK/overlay.d/sbin;
} # end attributes

# boot shell variables
BLOCK=boot;
IS_SLOT_DEVICE=1;
RAMDISK_COMPRESSION=auto;
PATCH_VBMETA_FLAG=auto;

# import functions/variables and setup patching - see for reference (DO NOT REMOVE)
. tools/ak3-core.sh;

# boot install
dump_boot;

write_boot;
## end boot install


## vendor_boot files attributes
vendor_boot_attributes() {
set_perm_recursive 0 0 755 644 $RAMDISK/*;
} # end attributes

# vendor_boot shell variables
BLOCK=vendor_boot;
IS_SLOT_DEVICE=1;
RAMDISK_COMPRESSION=auto;
PATCH_VBMETA_FLAG=auto;

# reset for vendor_boot patching
reset_ak;

# vendor_boot install
dump_boot;

write_boot;
## end vendor_boot install
