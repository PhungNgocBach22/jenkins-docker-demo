pipeline {
    agent any // Chạy pipeline trên bất kỳ agent nào có sẵn

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    // Xây dựng Docker image và đặt tên (tag) là 'my-flask-app'
                    sh 'docker build -t my-flask-app:latest .'
                }
            }
        }
        stage('Deploy Application') {
            steps {
                script {
                    // Dừng và xóa container cũ nếu nó đang tồn tại để tránh xung đột
                    sh 'docker stop my-flask-app-container || true'
                    sh 'docker rm my-flask-app-container || true'

                    // Chạy container mới từ image vừa build
                    // -d: chạy ở chế độ nền (detached)
                    // --name: đặt tên cho container để dễ quản lý
                    // -p 5001:5000: ánh xạ cổng 5001 của máy chủ vào cổng 5000 của container
                    sh 'docker run -d --name my-flask-app-container -p 5001:5000 my-flask-app:latest'
                }
            }
        }
    }
    post {
        always {
            echo 'Pipeline finished.'
            // Dọn dẹp các image không còn được sử dụng để tiết kiệm dung lượng
            sh 'docker image prune -f'
        }
    }
}
