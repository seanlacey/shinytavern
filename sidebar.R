sidebar <- bs4DashSidebar(bs4SidebarMenu(
                            bs4SidebarHeader("Cards"),
                            bs4SidebarMenuItem(
                              "Characters",
                              tabname="chars",
                              icon = "users"
                            ),
                            bs4SidebarMenuItem(
                              "Character Cloud",
                              tabName = "wordCloud",
                              icon = "cloud"
                            )),
                          title="TavernApp",
                          src="tavernapplogo.png",
                          skin="light")