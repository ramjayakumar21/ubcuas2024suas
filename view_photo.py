import os
import time
import cv2

# Path to the folder containing photos
FOLDER_PATH = "/home/kannan/UAS-SUAS-2024/ODLC-2023/src/predict/live_feed_new"

# Function to get the latest image file from the folder
def get_latest_image(folder_path):
    try:
        files = [os.path.join(folder_path, f) for f in os.listdir(folder_path) if f.lower().endswith(('.png', '.jpg', '.jpeg', '.gif'))]
        if not files:
            return None
        latest_file = max(files, key=os.path.getctime)
        return latest_file
    except Exception as e:
        print(f"Error while fetching latest image: {e}")
        return None

# Function to display the latest image
def display_latest_image():
    while True:
        latest_image = get_latest_image(FOLDER_PATH)
        if latest_image:
            img = cv2.imread(latest_image)
            if img is not None:
                img = cv2.resize(img, (400, 300))
                cv2.namedWindow('resized', cv2.WINDOW_NORMAL)
                cv2.imshow("resized", img)

        
        if cv2.waitKey(5000) & 0xFF == ord('q'):  # Check for 'q' key to exit
            break

    cv2.destroyAllWindows()

# Start displaying the latest image
display_latest_image()