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

# 函数：获取网络吞吐量（MB/s）
get_network_throughput() {
    # 获取默认网络接口名称
    INTERFACE=$(ip -o -4 route show to default | awk '{print $5}')
    
    # 从 /proc/net/dev 中提取接收和发送字节数
    get_bytes() {
        cat /proc/net/dev | grep $INTERFACE | awk '{print $2,$10}'
    }

    # 获取初始的接收和发送字节数
    read RX_BYTES TX_BYTES <<< $(get_bytes)

    # 等待一段时间（例如 1 秒）
    sleep 1

    # 获取新的接收和发送字节数
    read RX_BYTES_NEW TX_BYTES_NEW <<< $(get_bytes)

    # 计算吞吐量（单位：字节/秒）
    RX_THROUGHPUT=$((RX_BYTES_NEW - RX_BYTES))
    TX_THROUGHPUT=$((TX_BYTES_NEW - TX_BYTES))

    # 将字节转换为 MB（1 MB = 1024 * 1024 字节）
    RX_THROUGHPUT_MB=$((RX_THROUGHPUT / (1024 * 1024)))
    TX_THROUGHPUT_MB=$((TX_THROUGHPUT / (1024 * 1024)))

    # 输出结果
    echo "网络接口: $INTERFACE"
    echo "接收吞吐量: $RX_THROUGHPUT_MB MB/s"
    echo "发送吞吐量: $TX_THROUGHPUT_MB MB/s"
}

# 移除 MP3 文件中的图片
remove_mp3_images() {
    local input_file="$1"
    local output_file="${input_file%.mp3}_noimg.mp3"

    # 使用 ffmpeg 移除图片
    ffmpeg -i "$input_file" -map 0:a -c:a copy -map_metadata -1 "$output_file" > /dev/null 2>&1

    # 如果成功，替换原文件
    if [ $? -eq 0 ]; then
        mv "$output_file" "$input_file"
        echo "已处理: $input_file"
    else
        echo "处理失败: $input_file"
        rm -f "$output_file" 2>/dev/null
    fi
}

export -f remove_mp3_images
