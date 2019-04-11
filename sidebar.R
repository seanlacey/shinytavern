sidebar <- bs4DashSidebar(bs4SidebarMenu(
                            bs4SidebarHeader("Cards"),
                            bs4SidebarMenuItem(
                              "Characters",
                              tabname="chars",
                              icon = "users"
                            ),
                            bs4SidebarMenuItem(
                              "Word Cloud",
                              tabName = "wordCloud",
                              icon = "sliders"
                            )),
                          title="TavernApp",
                          src="tavernapplogo.png",
                          skin="light")