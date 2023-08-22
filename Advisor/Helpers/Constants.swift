//
//  Constants.swift
//  Advisor
//
//  Created by Ahmet Ali ÇETİN on 22.08.2023.
//

import Foundation

enum Constants {
    enum ButtonImages {
        enum Music {
            static func getRandImage() -> String {
                let musics: [String] = ["https://studyworkgrow.com.au/wp-content/uploads/2021/03/Music-Therapist-JS-1024x576.png",
                                        "https://w.forfun.com/fetch/93/931be4d4f16556b7d2c8b94ae4e1f4c4.jpeg",
                                        "https://wallpaper-house.com/data/out/8/wallpaper2you_252544.jpg",
                                        "https://wallpaper-house.com/data/out/8/wallpaper2you_252549.jpg",
                                        "https://images.unsplash.com/photo-1507838153414-b4b713384a76?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8bXVzaWN8ZW58MHx8MHx8fDA%3D&w=1000&q=80",
                                        
                ]
                return musics.randomElement()!
            }
        }
        enum Book {
            static func getRandImage() -> String {
                let books: [String] = [ "https://www.londonlibrary.co.uk/images/CHARLOTTE/NEW_WEBSITE_IMAGES/adoptbanner.jpg",
                                        "https://c0.wallpaperflare.com/preview/469/70/385/background-book-bookcase-books.jpg",
                                        "https://images.unsplash.com/photo-1516979187457-637abb4f9353?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MTZ8fHxlbnwwfHx8fHw%3D&w=1000&q=80",
                                        "https://images.wallpaperscraft.com/image/single/books_old_reading_124989_1920x1080.jpg",
                                        "https://p4.wallpaperbetter.com/wallpaper/842/697/107/landscape-4k-book-scenery-wallpaper-preview.jpg"
                ]
                
                return books.randomElement()!
            }
        }
        enum Movie {
            static func getRandImage() -> String {
                let movies: [String] = [ "https://media.istockphoto.com/id/1295114854/photo/empty-red-armchairs-of-a-theater-ready-for-a-show.jpg?s=612x612&w=0&k=20&c=0rDtwzMmLbqe_8GuGw2dpjkD0MsXGywJmdmg0jDbMxQ=",
                                         "https://wallpaperaccess.com/full/329583.jpg",
                                         "https://www.pixelstalk.net/wp-content/uploads/2016/07/Free-1080p-Movie-HD-Pictures.jpg",
                                         "https://images7.alphacoders.com/404/404984.jpg",
                                         "https://images2.alphacoders.com/130/1308182.jpeg"
                
                ]
                return movies.randomElement()!
            }
            
        }
    }
    
}
