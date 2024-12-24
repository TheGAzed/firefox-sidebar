const handleClick = () => {
	console.log(browser.sidebarAction.getPanel())
	browser.sidebarAction.toggle();
}

browser.browserAction.onClicked.addListener(handleClick);