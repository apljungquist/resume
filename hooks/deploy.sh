# Automatically add actions to hooks. 
# To be executed from the directory in which the it and the actions reside.
root_dir="$(git rev-parse --show-toplevel)"

action_filename="update-head-info.sh"
for hook_name in "post-commit" "post-checkout" "post-merge"; do
	hook_filepath="${root_dir}/.git/hooks/${hook_name}"
	
	if [ ! -e "${hook_filepath}" ]; then
		echo "#!/bin/sh" >> "${hook_filepath}"
		chmod +x "${hook_filepath}"
	fi
	
	if grep -Fq "${action_filename}" "${hook_filepath}"; then
		echo "${action_filename} already deployed to ${hook_name}"
	else
		echo "# Automatic deployment of ${action_filename}" >> "${hook_filepath}"
		cat "${action_filename}" >> "${hook_filepath}"

	fi
done