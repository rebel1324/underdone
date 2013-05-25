local Player = FindMetaTable("Player")

function Player:UseSkill( strName )

	local tblSkillTable = SkillTable( strName )
	if tblSkillTable && tblSkillTable.OnUse && self:HasSkill( strName ) then
		
		intLevel = self.Data.Skills[ strName ]
		tblSkillTable:OnUse(self, intLevel)
		return true
		
	end
	return false
	
end

concommand.Add("UD_UseSkill", function(ply, command, args)
	ply:UseSkill(tostring(args[1]))
end)