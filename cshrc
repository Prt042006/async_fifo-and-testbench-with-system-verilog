#.cshrc
setenv SNPSLMD_LICENSE_FILE 27020@14.139.1.126
setenv SENTAURUS /home/usr/sentaurus/W-2024.09
setenv VERDI /home/usr/verdi/W-2024.09-1
setenv VCS /home/usr/vcs/W-2024.09-1
setenv SPYGLASS /home/usr/ufe_optional_spyglass-vcs/W-2024.09-SP2/SPYGLASS_HOME
setenv VC_STATIC /home/usr/vc_static/W-2024.09-2
setenv Design_compiler /home/usr/syn/W-2024.09-SP4
setenv ICC2 /home/usr/icc2/W-2024.09-SP2


## for example setenv PRIMETIME/<install-dir>/PT-2022.12/prime/U-2022.12

set path=($SENTAURUS/bin /usr/local/bin /bin /sbin /usr/bin /usr/local/bin /usr/local/sbin /usr/bin/X11 /usr/X11R6/lib/X11 /usr/X11R6/bin. $path)
set path=($VERDI/bin /usr/local/bin /bin /sbin /usr/bin /usr/local/bin /usr/local/sbin /usr/bin/X11 /usr/X11R6/lib/X11 /usr/X11R6/bin. $path)
set path=($VCS/bin /usr/local/bin /bin /sbin /usr/bin /usr/local/bin /usr/local/sbin /usr/bin/X11 /usr/X11R6/lib/X11 /usr/X11R6/bin. $path)
set path=($SPYGLASS/bin /usr/local/bin /bin /sbin /usr/bin /usr/local/bin /usr/local/sbin /usr/bin/X11 /usr/X11R6/lib/X11 /usr/X11R6/bin. $path)
set path=($VC_STATIC/bin /usr/local/bin /bin /sbin /usr/bin /usr/local/bin /usr/local/sbin /usr/bin/X11 /usr/X11R6/lib/X11 /usr/X11R6/bin. $path)
setenv FLEXLM_DIAGNOSTICS 3
set path=($Design_compiler/bin /usr/local/bin /bin /sbin /usr/bin /usr/local/bin /usr/local/sbin /usr/bin/X11 /usr/X11R6/lib/X11 /usr/X11R6/bin. $path)
set path=($ICC2/bin /usr/local/bin /bin /sbin /usr/bin /usr/local/bin /usr/local/sbin /usr/bin/X11 /usr/X11R6/lib/X11 /usr/X11R6/bin. $path)

echo "done sourcing Synopsys"

