# Automatically add actions to hooks, e.g. after cloning repository. 
git_dir="$(git rev-parse --show-toplevel)/.git" || exit

action_dir="$(dirname $0)"
action_filename="update-head-info.sh"
action_filepath="${action_dir}/${action_filename}"

for hook_filename in "post-commit" "post-checkout" "post-merge"; do
	hook_filepath="${git_dir}/hooks/${hook_filename}"
	
	if [ ! -e "${hook_filepath}" ]; then
		echo "Creating hook ${hook_filepath}"
		echo "#!/bin/sh" >> "${hook_filepath}"
		chmod +x "${hook_filepath}"
	fi
	
	if grep -Fq "${action_filename}" "${hook_filepath}"; then 
		echo "${action_filename} already deployed to ${hook_filepath}"
	else
		echo "Deploying ${action_filename} to ${hook_filepath}"
		echo "# Automatic deployment of ${action_filename}" >> "${hook_filepath}"
		cat "${action_filepath}" >> "${hook_filepath}"

	fi
done