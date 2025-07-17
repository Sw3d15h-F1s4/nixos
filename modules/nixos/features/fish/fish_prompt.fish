function fish_prompt
  if test $USER = root;
    set -g __user_color red
  else
    set -g __user_color blue
  end
  echo " "
  function __os_section
    function __impure_status
      if test $IN_NIX_SHELL;
        echo "!!"
      else
        echo " "
      end
    end
    string join '' -- (set_color 414B50 -b brblue) ' ' (__impure_status) (set_color brblue -b $__user_color) ''
  end

  function __user_section
    string join '' -- (set_color 414B50) ' ' $USER ' ' (set_color $__user_color -b cyan) ''
  end

  function __pwd_section
    string join '' -- (set_color 414b50) (prompt_pwd) ' ' (set_color cyan -b green) ''
  end

  function __vcs_section
    string join '' -- (set_color 414b50) (fish_vcs_prompt " ") (set_color green -b normal) ''
  end

  function __status_section
    if test $transient_pipestatus[-1] -eq 0;
      return
    else
      string join '' -- (set_color red) '' (set_color white -b red) ' ' $transient_pipestatus ' ' (set_color red -b normal) ''
    end
  end


  string join '' -- (__os_section) (__user_section) ' ' (__pwd_section) (__vcs_section) (__status_section)  (set_color normal) " "

  function __mode_section
    function __determine_mode
      switch $fish_bind_mode
        case default
          set_color --bold red
          echo 'N'
        case insert
          set_color --bold green
          echo 'I'
        case replace_one
          set_color --bold red
          echo 'R'
        case visual
          set_color --bold brmagenta
          echo 'V'
        case '*'
          set_color --bold red
          echo '?'
      end
    end
    string join '' -- '[' (__determine_mode) (set_color normal) '] '
  end


  echo -en (set_color cyan -b normal)"❯ "(set_color normal)
end


function fish_mode_prompt
end


function transient_prompt_func
  echo -en (set_color cyan)"❯ "(set_color normal)
end

function transient_rprompt_func
  echo -en (set_color brblack)"["(date "+%H:%M")"]"(set_color normal)
end
