//
//  MyEventView.swift
//  eventify
//
//  Created by BSTAR on 30/09/2025.
//

import SwiftUI

struct MyEventView: View {
    
    @EnvironmentObject private var vm: EventViewModel
    
    var body: some View {
        
        ZStack(alignment: .top) {
            
            Color.colors.background
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                AppBar(
                    text: "My Events",
                    hasLeadingIcon: false,
                    backgroundColor: Color.white
                )
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading) {
                        Text("Hosting")
                            .font(.openSansBold(size: 16))
                            .foregroundStyle(.textBlack)
                            .padding(.top, 10)
                        
                        PrimaryButton(text: "Create Event", color: .accent, onPressed: {
                            
                        }, hasWidth: false, padding: 20, icon: AnyView(Image("add-circle")))
                        .padding(.bottom, 5)
                        
                        VStack(spacing: 10) {
                            MyEventsTile(title: "Active Events", subtitle: "2 Upcoming Events today", icon: "time") {
                                
                            }
                            MyEventsTile(title: "Draft Events", subtitle: "3 drafts saved", icon: "license") {
                                
                            }
                            MyEventsTile(title: "Past Events", subtitle: "View event history", icon: "calendar") {
                                
                            }
                        }
                        .padding(.bottom, 10)
                        
                        Text("Attending")
                            .font(.openSansBold(size: 16))
                            .foregroundStyle(.textBlack)
                            .padding(.top, 10)
                        
                        VStack(spacing: 10) {
                            MyEventsTile(title: "Upcoming Events", subtitle: "4 events to attend", icon: "calendar") {
                                
                            }
                            MyEventsTile(title: "My Tickets", subtitle: "View past and current tickets", icon: "ticket") {
                                
                            }
                            MyEventsTile(title: "Saved Events", subtitle: "Events you’re interested in", icon: "favourite") {
                                
                            }
                        }
                        
                    }
                    .padding(.horizontal, 20)
                }
                
            }
            
        }
        
    }
}

#Preview {
    MyEventView()
        .environmentObject(EventViewModel())
}
