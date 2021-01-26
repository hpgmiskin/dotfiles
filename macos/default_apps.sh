
# osascript -e 'id of app "Visual Studio Code"'

VSCODE_APP_ID="com.microsoft.VSCode"
VSCODE_EXTENSIONS=(
    .js
    .ts
    .log
    .txt
    .json
    .py
)

associate_extensions(){
    for extension in ${extensions[@]}; do
        echo "use ${app_id} for ${extension} files"
        # duti -s "${app_id}" "${extension}" all
    done
}

associate_all_extensions(){
    local app_id=${VSCODE_APP_ID}
    local extensions=${VSCODE_EXTENSIONS[@]}
    associate_extensions
}

associate_all_extensions
