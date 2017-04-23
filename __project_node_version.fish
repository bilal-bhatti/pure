function __project_node_version --description 'traverse up to find .nvmrc/version file'
  set -l path (pwd)

  while begin; test "$path" != ""; and not test -e $path/.nvmrc; end
	  set path (echo $path | sed -e 's/\/[^\/]*$//')
  end

  if test -e $path/.nvmrc
	  set nv (string trim -l -c=v (cat $path/.nvmrc 2>/dev/null))
	  echo -n -s $nv
  end

  return 0
end
