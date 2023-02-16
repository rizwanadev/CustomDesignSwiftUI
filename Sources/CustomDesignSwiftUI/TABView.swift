//
//  SwiftUIView.swift
//  
//
//  Created by rizwana desai on 16/02/23.
//

import SwiftUI

@available(iOS 14, macOS 11.0, *)
struct TABView<Content: View>: View {
    
    let viewBuilder: () -> Content
    @ObservedObject var tabItems = TabItemsData()
    
    var body: some View {
        
        TabView {
            
            ForEach(tabItems.tabItems) { tabItem in
                viewBuilder()
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .tabItem {
                        Image(systemName: tabItem.icon)
                        Text(tabItem.name)
                    }
            }
            //"house.fill"
            
            Text("Bookmark Tab")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "bookmark.circle.fill")
                    Text("Bookmark")
                }
            
            Text("Video Tab")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "video.circle.fill")
                    Text("Video")
                }
            
            Text("Profile Tab")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
        }
        .accentColor(.red)
        Spacer()
    }
}


@available(iOS 14, macOS 11.0, *)
struct TABView_Previews: PreviewProvider {
    static var previews: some View {
        TABView{
            Text("DYNAMIC VIEW PREVIEW")
            
        }
    }
}



@available(iOS 14, macOS 11.0, *)

class TabItemsData :ObservableObject{
    @Published var tabItems = [TabItem]()
}

class TabItem : Identifiable{
    let id = UUID()
    var name = ""
    var icon = ""
}
