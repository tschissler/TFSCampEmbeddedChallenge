param (
    [Parameter(Mandatory=$true)]
    [String] $binPath
)

# If esptool.py is not installed, you can install it by running "pip install esptool"
esptool.py `
    --chip esp32 `
    --before default_reset `
    --after hard_reset `
    write_flash `
    -z `
    --flash_mode dio `
    --flash_freq 40m `
    --flash_size detect `
    0x8000 $binPath/partitions.bin `
    0x10000 $binPath/firmware.bin
 
