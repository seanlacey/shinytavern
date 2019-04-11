sidebar <- bs4DashSidebar(bs4SidebarMenu(
                            bs4SidebarHeader("Cards"),
                            bs4SidebarMenuItem(
                              "Character Chart",
                              tabName = "wordCloud",
                              icon = "sliders"
                            )),
                          title="TavernApp",
                          src="tavernapplogo.png",
                          skin="light")