# 定义函数：去掉文件名中的指定字符串
remove_string_from_filenames() {
    local target_string="$1"  # 获取输入参数

    # 检查是否提供了参数
    if [[ -z "$target_string" ]]; then
        echo "错误：请提供要删除的字符串作为参数。"
        return 1
    fi

    # 遍历当前文件夹下的所有文件
    for file in *; do
        # 检查是否是文件（排除目录）
        if [[ -f "$file" ]]; then
            # 去掉文件名中的目标字符串
            new_name="${file//$target_string/}"
            # 如果新文件名与旧文件名不同，则重命名
            if [[ "$new_name" != "$file" ]]; then
                mv -- "$file" "$new_name"
                echo "已重命名：$file -> $new_name"
            fi
        fi
    done

    echo "操作完成！"
}
