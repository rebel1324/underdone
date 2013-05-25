pac_luamodel[ "armor_helm_headcrab" ] = {  [1] = {
	["children"] = {
		[1] = {
			["children"] = {
				[1] = {
					["children"] = {
					},
					["self"] = {
						["ParentName"] = "lamarr",
						["UniqueID"] = "499513584",
						["SequenceName"] = "Drown",
						["Name"] = "",
						["ClassName"] = "animation",
						["PingPongLoop"] = true,
						["ParentUID"] = "920473169",
						["Max"] = 0.25,
						["Min"] = 0.15,
						["GlobalID"] = "206443253",
					},
				},
			},
			["self"] = {
				["ParentName"] = "my outfit",
				["Position"] = Vector(-0.0966796875, -3.84619140625, 0.48333740234375),
				["Name"] = "",
				["ClassName"] = "model",
				["ParentUID"] = "2825206971",
				["EditorExpand"] = true,
				["GlobalID"] = "2530505677",
				["Angles"] = Angle(179.1875, 102.875, 90.375),
				["Model"] = "models/Lamarr.mdl",
				["UniqueID"] = "920473169",
			},
		},
	},
	["self"] = {
		["GlobalID"] = "4033233152",
		["UniqueID"] = "2825206971",
		["ClassName"] = "group",
		["EditorExpand"] = true,
		["Name"] = "my outfit",
		["Description"] = "add parts to me!",
	},
},
}

pac_luamodel[ "armor_helm_pheadcrab" ] = {  [1] = {
	["children"] = {
		[1] = {
			["children"] = {
				[1] = {
					["children"] = {
					},
					["self"] = {
						["ParentName"] = "headcrabblack",
						["UniqueID"] = "499513584",
						["SequenceName"] = "Drown",
						["Name"] = "",
						["ClassName"] = "animation",
						["PingPongLoop"] = true,
						["ParentUID"] = "920473169",
						["Max"] = 0.4,
						["Min"] = 0.3,
						["GlobalID"] = "206443253",
					},
				},
			},
			["self"] = {
				["ParentName"] = "my outfit",
				["Position"] = Vector(-8.677734375, -8.27001953125, -0.25489807128906),
				["Name"] = "",
				["ClassName"] = "model",
				["ParentUID"] = "2825206971",
				["EditorExpand"] = true,
				["GlobalID"] = "2530505677",
				["Angles"] = Angle(0.625, -60.40625, -89.375),
				["Model"] = "models/headcrabblack.mdl",
				["UniqueID"] = "920473169",
			},
		},
	},
	["self"] = {
		["GlobalID"] = "4033233152",
		["UniqueID"] = "2825206971",
		["ClassName"] = "group",
		["EditorExpand"] = true,
		["Name"] = "my outfit",
		["Description"] = "add parts to me!",
	},
},
}

pac_luamodel[ "armor_shoulder_light" ] = {

[1] = {
	["children"] = {
		[1] = {
			["children"] = {
				[1] = {
					["children"] = {
					},
					["self"] = {
						["ParentName"] = "light spotlight lamp",
						["UniqueID"] = "2254440285",
						["Name"] = "",
						["ClassName"] = "light",
						["Size"] = 256,
						["ParentUID"] = "1727742141",
						["GlobalID"] = "1139336197",
						["Position"] = Vector(15.64453125, -0.00030517578125, -0.000732421875),
						["Brightness"] = 0.001,
						["EditorExpand"] = true,
					},
				},
				[2] = {
					["children"] = {
					},
					["self"] = {
						["ParentName"] = "light spotlight lamp",
						["UniqueID"] = "897707062",
						["SpritePath"] = "sprites/glow04_noz",
						["Name"] = "",
						["ClassName"] = "sprite",
						["Size"] = 10.75,
						["Position"] = Vector(2.4503173828125, 0.00054931640625, 0.81907653808594),
						["GlobalID"] = "3863945626",
						["ParentUID"] = "1727742141",
					},
				},
			},
			["self"] = {
				["ParentName"] = "my outfit",
				["Position"] = Vector(-1.0439453125, 6.1209869384766, 6.6634216308594),
				["Name"] = "",
				["Angles"] = Angle(0.15625, 0, 0),
				["EditorExpand"] = true,
				["ClassName"] = "model",
				["Size"] = 0.275,
				["UniqueID"] = "1727742141",
				["GlobalID"] = "1550223012",
				["Bone"] = "chest",
				["Model"] = "models/props_wasteland/light_spotlight01_lamp.mdl",
				["ParentUID"] = "1171934424",
			},
		},
		[2] = {
			["children"] = {
			},
			["self"] = {
				["ParentName"] = "my outfit",
				["UniqueID"] = "1557168466",
				["Name"] = "",
				["ClassName"] = "light",
				["Size"] = 128,
				["GlobalID"] = "300466920",
				["Bone"] = "hitpos",
				["Brightness"] = 0.01,
				["ParentUID"] = "1171934424",
			},
		},
	},
	["self"] = {
		["GlobalID"] = "2314647342",
		["UniqueID"] = "1171934424",
		["ClassName"] = "group",
		["EditorExpand"] = true,
		["Name"] = "my outfit",
		["Description"] = "add parts to me!",
	},
},


}

pac_luamodel[ "special_drill" ] = {

[1] = {
	["children"] = {
		[1] = {
			["children"] = {
				[1] = {
					["children"] = {
						[1] = {
							["children"] = {
							},
							["self"] = {
								["ParentName"] = "utilityconnecter",
								["Position"] = Vector(4.802490234375, -4.8603515625, 0.33367919921875),
								["Name"] = "trappropeller engine",
								["ClassName"] = "model",
								["Size"] = 0.475,
								["ParentUID"] = "2986590923",
								["GlobalID"] = "2447899499",
								["Angles"] = Angle(3.9565453529358, 179.9992980957, 89.998275756836),
								["Model"] = "models/props_c17/TrapPropeller_Engine.mdl",
								["UniqueID"] = "3096713520",
							},
						},
						[2] = {
							["children"] = {
							},
							["self"] = {
								["ParentName"] = "utilityconnecter",
								["Position"] = Vector(-0.0029296875, -9.44287109375, 3.6215209960938),
								["Name"] = "battery",
								["ClassName"] = "model",
								["ParentUID"] = "2986590923",
								["GlobalID"] = "4216967087",
								["Angles"] = Angle(-90, -90.000022888184, 0),
								["Model"] = "models/Items/battery.mdl",
								["UniqueID"] = "395576686",
							},
						},
						[3] = {
							["children"] = {
								[1] = {
									["children"] = {
									},
									["self"] = {
										["Max"] = 2,
										["UniqueID"] = "3331118390",
										["Axis"] = "pitch",
										["Name"] = "angleoffset = 20061828 proxy",
										["VariableName"] = "AngleOffset",
										["ClassName"] = "proxy",
										["Additive"] = true,
										["InputMultiplier"] = 0.5,
										["ParentUID"] = "2625928355",
										["GlobalID"] = "439100557",
										["Function"] = "none",
										["ParentName"] = "hoverball",
									},
								},
								[2] = {
									["children"] = {
									},
									["self"] = {
										["ParentName"] = "hoverball",
										["Position"] = Vector(-0.00146484375, 11.35791015625, 0.014404296875),
										["ParentUID"] = "2625928355",
										["Name"] = "utilityconnecterc",
										["Scale"] = Vector(1, 1, 0.69999998807907),
										["EditorExpand"] = true,
										["ClassName"] = "model",
										["Size"] = 0.775,
										["UniqueID"] = "1898625540",
										["GlobalID"] = "2167972668",
										["Angles"] = Angle(0, 0, -90),
										["Model"] = "models/props_c17/utilityconnecter006c.mdl",
										["AngleOffset"] = Angle(0, 0, -0.40000000596046),
									},
								},
							},
							["self"] = {
								["ParentName"] = "utilityconnecter",
								["UniqueID"] = "2625928355",
								["Name"] = "hoverball",
								["ClassName"] = "model",
								["Size"] = 0.525,
								["GlobalID"] = "4038094159",
								["ParentUID"] = "2986590923",
								["AngleOffset"] = Angle(20061828, 0, 0),
								["EditorExpand"] = true,
							},
						},
					},
					["self"] = {
						["ParentName"] = "w physics",
						["Position"] = Vector(16.12060546875, 0.0010986328125, 0.48272705078125),
						["Name"] = "utilityconnecter",
						["ClassName"] = "model",
						["ParentUID"] = "2259743259",
						["EditorExpand"] = true,
						["GlobalID"] = "3778202474",
						["Angles"] = Angle(0, -90, 0),
						["Model"] = "models/props_c17/utilityconnecter006.mdl",
						["UniqueID"] = "2986590923",
					},
				},
			},
			["self"] = {
				["ParentName"] = "my outfit",
				["Position"] = Vector(-0.4873046875, -1.6630249023438, 2.5158081054688),
				["Name"] = "w physics",
				["Angles"] = Angle(-0.04825272783637, -14.851088523865, 22.815057754517),
				["ClassName"] = "model",
				["EditorExpand"] = true,
				["UniqueID"] = "2259743259",
				["GlobalID"] = "168192739",
				["Bone"] = "anim_attachment_rh",
				["Model"] = "models/Weapons/w_physics.mdl",
				["ParentUID"] = "4213557238",
			},
		},
	},
	["self"] = {
		["GlobalID"] = "4189438956",
		["UniqueID"] = "4213557238",
		["ClassName"] = "group",
		["EditorExpand"] = true,
		["Name"] = "my outfit",
		["Description"] = "add parts to me!",
	},
},


}