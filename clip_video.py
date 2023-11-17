import os
from moviepy.editor import VideoFileClip

def cut_into_frames(input_file, output_folder):
    # 打開影片檔案
    video_clip = VideoFileClip(input_file)

    # 提取每一幀的圖像
    frames = video_clip.iter_frames(fps=1, dtype="uint8")

    # 建立輸出資料夾
    os.makedirs(output_folder, exist_ok=True)

    # 儲存每一幀的圖像
    for i, frame in enumerate(frames):
        frame_image = Image.fromarray(frame)
        frame_image.save(f"{output_folder}/frame_{i + 1}.png")

    # 釋放資源
    video_clip.close()

def process_videos(input_folder, output_base_folder):
    # 遍歷影片檔案的資料夾
    for root, dirs, files in os.walk(input_folder):
        for file in files:
            if file.endswith(".mp4"):
                # 獲取影片檔案的路徑
                input_file = os.path.join(root, file)

                # 提取影片檔案名稱（不包括擴展名）
                video_name = os.path.splitext(file)[0]

                # 輸出資料夾名稱
                output_folder = os.path.join(output_base_folder, f"output_frames_{video_name}")

                # 切割影片成一幀一幀的圖像
                cut_into_frames(input_file, output_folder)

if __name__ == "__main__":
    # 設定輸入影片檔案所在的資料夾和輸出資料夾的基本路徑
    input_folder = "input_videos"
    output_base_folder = "output_frames"

    # 處理所有影片
    process_videos(input_folder, output_base_folder)

