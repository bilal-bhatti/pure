# display node version if .nvmrc file exists in the right prompt

set -g icon_node ⬡" "

function fish_right_prompt
  set pnv (string trim (__project_node_version))
  if test $pnv
	  echo -n -s "$pure_color_cyan$icon_node$pnv$pure_color_normal"
  end
end
