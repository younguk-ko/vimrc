set-alias ll ls

set-alias con conda
function act {
	con activate yuko
}
set-alias vi "c:/Program Files/Vim/vim90/gvim.exe"
function vp {
	vi $profile
}
set-alias sop Source-Profile
function Source-Profile {
    . $profile
}
#region conda initialize
# !! Contents within this block are managed by 'conda init' !!
(& "C:\Users\young\miniconda3\Scripts\conda.exe" "shell.powershell" "hook") | Out-String | Invoke-Expression
#endregion
