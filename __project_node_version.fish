function __project_node_version --description 'traverse up to find .nvmrc/version file, upto home directory'
  set -l path (pwd)

  while test -n (string trim $path); and test $path != $HOME
    if test -f $path/.nvmrc
      set nv (string trim -l -c=v (cat $path/.nvmrc 2>/dev/null))
      echo -n -s $nv
      return 0
    end
		set path (dirname $path)
  end

  return 0
end
