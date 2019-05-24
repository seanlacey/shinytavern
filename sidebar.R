sidebar <- bs4DashSidebar(bs4SidebarMenu(
                            bs4SidebarHeader("Cards"),
                            bs4SidebarMenuItem(
                              "Characters",
                              tabName="chars",
                              icon = "users"
                            ),
                            bs4SidebarMenuItem(
                              "Character Cloud",
                              tabName = "wordCloud",
                              icon = "cloud"
                            ),
                            bs4SidebarMenuItem(
                              "Acknowledgements",
                              tabName = "ack",
                              icon = "info-circle"
                            )),
                          title="TavernApp",
                          src="tavernapplogo.png",
                          skin="light")