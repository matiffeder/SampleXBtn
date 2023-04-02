local add={
	--you can't change "btn", "name", "texture"
	btn={
		name="Sample",
		--texture for your button
		texture="Interface/Icons/drug_001",
	--[[the other function for XBar
	--read more in http://rom.curseforge.com/addons/sample-xbar-addon-management/
	--###you can also add your original GUI to XBar
	gui={{
		name = "Sample",
		version = "0.6",
		window = "SampleGUI",
	}},
	--###you can also add some function in popup menu which in XBar
	popup={{
		icon = "Interface/MainMenuFrame/Mainpopupbutton-Icon-Title",
		GetText = function() return "Sample"; end,
		GetTooltip = function() return "/sample\n\nAuthor"; end,
		OnClick = function(this, key) XAddon_ShowPage("SampleGUI"); end,
	]]
}};

function XBarSample_OnEvent(event)
	--check version of XBar
	if XBARVERSION and XBARVERSION>=1.51 then
		--default setting for your button's offset in XBar
		--XBar will help you save offset
		--you can also not set default, but the button will behind other button which add to XBar
		if XBSet["Sample_X"]==nil then
			XBSet["Sample_X"]=300;
		end
		--regist button, gui and popup.
		XAddon_Register(add);
		--after you regist buttons
		--XBar will help you create following frames according "add.name"
		--ex. add.name=XXX >> create XBarXXX_B
			--XBarSample_B: Button
			--XBarSample_B_T: Button texture
			--XBarSample_F: font frame
			--XBarSample_F_S: FontString layer
			--and other frames which you don't need to use
	end
	--name of button's FontString
	XBarSample_F_S:SetText("Sample");
	--name of button
	XBarSample_B:SetScripts("OnEnter",
		[=[
			GameTooltip:SetOwner(this, "ANCHOR_TOPRIGHT", 0, 0);
			GameTooltip:SetText("Tooltip");
			--name of button's Texture
			XBarSample_B_T:SetTexture("Interface/Icons/drug_002");
		]=]);
	XBarSample_B:SetScripts("OnLeave",
		[=[
			GameTooltip:Hide();
			XBarSample_B_T:SetTexture("Interface/Icons/drug_001");
		]=]);
	--if you want to add OnMouseDown and OnMouseUp
	--you need remain following function
	--the function is made for move your button, and anchor to XBar
	--XBarSample_B:SetScripts("OnMouseDown", [=[XBar_MoveStart(key, XBarSample);]=]);
	--XBarSample_B:SetScripts("OnMouseUp", [=[XBar_MoveEnd(XBarSample);]=]);
	--XBar also did following
	--XBarSample_B:SetScripts("OnLoad", [=[this:RegisterForClicks("LeftButton","RightButton","MiddleButton");]=]);
end