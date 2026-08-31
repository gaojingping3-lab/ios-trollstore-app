import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "app.fill")
                .font(.system(size: 64))
                .foregroundColor(.blue)
            
            Text("TrollStore App")
                .font(.title)
                .fontWeight(.bold)
            
            Text("iOS App for TrollStore Sideloading")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            VStack(alignment: .leading, spacing: 12) {
                FeatureRow(icon: "checkmark.circle.fill", text: "无需开发者账号")
                FeatureRow(icon: "checkmark.circle.fill", text: "永久签名保留")
                FeatureRow(icon: "checkmark.circle.fill", text: "支持自定义应用")
                FeatureRow(icon: "checkmark.circle.fill", text: "快速安装部署")
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(8)
            
            Spacer()
            
            VStack(spacing: 12) {
                Button(action: {}) {
                    Text("安装应用")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                
                Button(action: {}) {
                    Text("应用列表")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(8)
                }
            }
        }
        .padding()
    }
}

struct FeatureRow: View {
    let icon: String
    let text: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(.green)
            Text(text)
                .font(.body)
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
