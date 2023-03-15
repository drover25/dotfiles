function aws-login() {
  unset AWS_PROFILE
  aws-google-auth --bg-response js_enabled -k -p "$@"
  export AWS_PROFILE="$1"
  export AWS_EB_PROFILE="$1"
}

function aws-logout() {
  unset AWS_PROFILE
  unset AWS_EB_PROFILE
}

function _get_aws_profiles() {
  cat ~/.aws/config | grep '^\[' | sed -E 's/\[(profile )?(.*)\]/\2/g' | sort | paste -sd ' ' -
}

function _aws-login {
  _values -s ' ' 'profiles' $(_get_aws_profiles)
}

compdef _aws-login aws-login
