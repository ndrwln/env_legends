local gt = this.getroottable();

if (!("Injury" in gt.Const))
{
	gt.Const.Injury <- {};
}

gt.Const.Injury.BluntBody <- [
	{
		ID = "injury.fractured_hand",
		Threshold = 0.25,
		Script = "injury/fractured_hand_injury"
	},
	{
		ID = "injury.fractured_ribs",
		Threshold = 0.25,
		Script = "injury/fractured_ribs_injury"
	},
	{
		ID = "injury.crushed_finger",
		Threshold = 0.25,
		Script = "injury/crushed_finger_injury"
	},
	{
		ID = "injury.fractured_elbow",
		Threshold = 0.25,
		Script = "injury/fractured_elbow_injury"
	},
	{
		ID = "injury.sprained_ankle",
		Threshold = 0.25,
		Script = "injury/sprained_ankle_injury"
	},
	{
		ID = "injury.bruised_leg",
		Threshold = 0.25,
		Script = "injury/bruised_leg_injury"
	},
	{
		ID = "injury.dislocated_shoulder",
		Threshold = 0.5,
		Script = "injury/dislocated_shoulder_injury"
	},
	{
		ID = "injury.broken_arm",
		Threshold = 0.5,
		Script = "injury/broken_arm_injury"
	},
	{
		ID = "injury.smashed_hand",
		Threshold = 0.5,
		Script = "injury/smashed_hand_injury"
	},
	{
		ID = "injury.broken_ribs",
		Threshold = 0.5,
		Script = "injury/broken_ribs_injury"
	},
	{
		ID = "injury.broken_leg",
		Threshold = 0.5,
		Script = "injury/broken_leg_injury"
	}
];
gt.Const.Injury.BluntHead <- [
	{
		ID = "injury.broken_nose",
		Threshold = 0.25,
		Script = "injury/broken_nose_injury"
	},
	{
		ID = "injury.severe_concussion",
		Threshold = 0.5,
		Script = "injury/severe_concussion_injury"
	},
	{
		ID = "injury.crushed_windpipe",
		Threshold = 0.5,
		Script = "injury/crushed_windpipe_injury"
	},
	{
		ID = "injury.fractured_skull",
		Threshold = 0.6,
		Script = "injury/fractured_skull_injury"
	}
];
gt.Const.Injury.CuttingBody <- [
	{
		ID = "injury.deep_abdominal_cut",
		Threshold = 0.25,
		Script = "injury/deep_abdominal_cut_injury"
	},
	{
		ID = "injury.cut_leg_muscles",
		Threshold = 0.25,
		Script = "injury/cut_leg_muscles_injury"
	},
	{
		ID = "injury.cut_arm_sinew",
		Threshold = 0.25,
		Script = "injury/cut_arm_sinew_injury"
	},
	{
		ID = "injury.cut_arm",
		Threshold = 0.25,
		Script = "injury/cut_arm_injury"
	},
	{
		ID = "injury.cut_artery",
		Threshold = 0.25,
		Script = "injury/cut_artery_injury"
	},
	{
		ID = "injury.exposed_ribs",
		Threshold = 0.25,
		Script = "injury/exposed_ribs_injury"
	},
	{
		ID = "injury.split_shoulder",
		Threshold = 0.5,
		Script = "injury/split_shoulder_injury"
	},
	{
		ID = "injury.cut_achilles_tendon",
		Threshold = 0.5,
		Script = "injury/cut_achilles_tendon_injury"
	},
	{
		ID = "injury.split_hand",
		Threshold = 0.5,
		Script = "injury/split_hand_injury"
	},
	{
		ID = "injury.deep_chest_cut",
		Threshold = 0.5,
		Script = "injury/deep_chest_cut_injury"
	}
];
gt.Const.Injury.CuttingHead <- [
	{
		ID = "injury.ripped_ear",
		Threshold = 0.25,
		Script = "injury/ripped_ear_injury"
	},
	{
		ID = "injury.split_nose",
		Threshold = 0.25,
		Script = "injury/split_nose_injury"
	},
	{
		ID = "injury.pierced_cheek",
		Threshold = 0.25,
		Script = "injury/pierced_cheek_injury"
	},
	{
		ID = "injury.grazed_neck",
		Threshold = 0.25,
		Script = "injury/grazed_neck_injury"
	},
	{
		ID = "injury.deep_face_cut",
		Threshold = 0.5,
		Script = "injury/deep_face_cut_injury"
	},
	{
		ID = "injury.cut_throat",
		Threshold = 0.5,
		Script = "injury/cut_throat_injury"
	}
];
gt.Const.Injury.PiercingBody <- [
	{
		ID = "injury.pierced_leg_muscles",
		Threshold = 0.25,
		Script = "injury/pierced_leg_muscles_injury"
	},
	{
		ID = "injury.injured_shoulder",
		Threshold = 0.25,
		Script = "injury/injured_shoulder_injury"
	},
	{
		ID = "injury.pierced_hand",
		Threshold = 0.25,
		Script = "injury/pierced_hand_injury"
	},
	{
		ID = "injury.pierced_chest",
		Threshold = 0.25,
		Script = "injury/pierced_chest_injury"
	},
	{
		ID = "injury.pierced_side",
		Threshold = 0.25,
		Script = "injury/pierced_side_injury"
	},
	{
		ID = "injury.pierced_arm_muscles",
		Threshold = 0.25,
		Script = "injury/pierced_arm_muscles_injury"
	},
	{
		ID = "injury.grazed_kidney",
		Threshold = 0.5,
		Script = "injury/grazed_kidney_injury"
	},
	{
		ID = "injury.pierced_lung",
		Threshold = 0.5,
		Script = "injury/pierced_lung_injury"
	},
	{
		ID = "injury.stabbed_guts",
		Threshold = 0.5,
		Script = "injury/stabbed_guts_injury"
	},
	{
		ID = "injury.injured_knee_cap",
		Threshold = 0.5,
		Script = "injury/injured_knee_cap_injury"
	}
];
gt.Const.Injury.PiercingHead <- [
	{
		ID = "injury.ripped_ear",
		Threshold = 0.25,
		Script = "injury/ripped_ear_injury"
	},
	{
		ID = "injury.pierced_cheek",
		Threshold = 0.25,
		Script = "injury/pierced_cheek_injury"
	},
	{
		ID = "injury.grazed_neck",
		Threshold = 0.25,
		Script = "injury/grazed_neck_injury"
	},
	{
		ID = "injury.grazed_eye_socket",
		Threshold = 0.5,
		Script = "injury/grazed_eye_socket_injury"
	},
	{
		ID = "injury.crushed_windpipe",
		Threshold = 0.5,
		Script = "injury/crushed_windpipe_injury"
	}
];
gt.Const.Injury.BurningBody <- [
	{
		ID = "injury.burnt_legs",
		Threshold = 0.25,
		Script = "injury/burnt_legs_injury"
	},
	{
		ID = "injury.burnt_hands",
		Threshold = 0.5,
		Script = "injury/burnt_hands_injury"
	}
];
gt.Const.Injury.BurningHead <- [
	{
		ID = "injury.burnt_face",
		Threshold = 0.25,
		Script = "injury/burnt_face_injury"
	},
	{
		ID = "injury.inhaled_flames",
		Threshold = 0.5,
		Script = "injury/inhaled_flames_injury"
	}
];
gt.Const.Injury.All <- [];
gt.Const.Injury.All.extend(this.Const.Injury.BluntBody);
gt.Const.Injury.All.extend(this.Const.Injury.BluntHead);
gt.Const.Injury.All.extend(this.Const.Injury.CuttingBody);
gt.Const.Injury.All.extend(this.Const.Injury.CuttingHead);
gt.Const.Injury.All.extend(this.Const.Injury.PiercingBody);
gt.Const.Injury.All.extend(this.Const.Injury.PiercingHead);
gt.Const.Injury.CuttingAndPiercingBody <- clone this.Const.Injury.CuttingBody;
gt.Const.Injury.CuttingAndPiercingBody.extend(this.Const.Injury.PiercingBody);
gt.Const.Injury.CuttingAndPiercingHead <- clone this.Const.Injury.CuttingHead;
gt.Const.Injury.CuttingAndPiercingHead.extend(this.Const.Injury.PiercingHead);
gt.Const.Injury.BluntAndPiercingBody <- clone this.Const.Injury.BluntBody;
gt.Const.Injury.BluntAndPiercingBody.extend(this.Const.Injury.PiercingBody);
gt.Const.Injury.BluntAndPiercingHead <- clone this.Const.Injury.BluntHead;
gt.Const.Injury.BluntAndPiercingHead.extend(this.Const.Injury.PiercingHead);
gt.Const.Injury.BurningAndPiercingBody <- clone this.Const.Injury.BurningBody;
gt.Const.Injury.BurningAndPiercingBody.extend(this.Const.Injury.BurningBody);
gt.Const.Injury.BurningAndPiercingBody.extend(this.Const.Injury.PiercingBody);
gt.Const.Injury.BurningAndPiercingHead <- clone this.Const.Injury.BurningHead;
gt.Const.Injury.BurningAndPiercingHead.extend(this.Const.Injury.PiercingHead);
gt.Const.Injury.Burning <- clone this.Const.Injury.BurningBody;
gt.Const.Injury.Burning.extend(this.Const.Injury.BurningHead);
gt.Const.Injury.Permanent <- [
	{
		ID = "injury.missing_nose",
		Script = "injury_permanent/missing_nose_injury"
	},
	{
		ID = "injury.missing_eye",
		Script = "injury_permanent/missing_eye_injury"
	},
	{
		ID = "injury.missing_ear",
		Script = "injury_permanent/missing_ear_injury"
	},
	{
		ID = "injury.brain_damage",
		Script = "injury_permanent/brain_damage_injury"
	},
	{
		ID = "injury.traumatized",
		Script = "injury_permanent/traumatized_injury"
	},
	{
		ID = "injury.broken_knee",
		Script = "injury_permanent/broken_knee_injury"
	},
	{
		ID = "injury.weakened_heart",
		Script = "injury_permanent/weakened_heart_injury"
	},
	{
		ID = "injury.collapsed_lung_part",
		Script = "injury_permanent/collapsed_lung_part_injury"
	},
	{
		ID = "injury.missing_finger",
		Script = "injury_permanent/missing_finger_injury"
	},
	{
		ID = "injury.maimed_foot",
		Script = "injury_permanent/maimed_foot_injury"
	},
	{
		ID = "injury.broken_elbow_joint",
		Script = "injury_permanent/broken_elbow_joint_injury"
	},
	{
		ID = "injury.missing_hand",
		Script = "injury_permanent/missing_hand_injury"
	},
	{
		ID = "injury.legend_scarred_injury",
		Script = "injury_permanent/legend_scarred_injury"
	},
	{
		ID = "injury.legend_burned_injury",
		Script = "injury_permanent/legend_burned_injury"
	}
];
gt.Const.Injury.Flagellation <- [
	{
		ID = "injury.exposed_ribs",
		Threshold = 0.35,
		Script = "injury/exposed_ribs_injury"
	},
	{
		ID = "injury.injured_shoulder",
		Threshold = 0.25,
		Script = "injury/injured_shoulder_injury"
	}
];
gt.Const.Injury.Concussion <- [
	{
		ID = "injury.severe_concussion",
		Threshold = 0.5,
		Script = "injury/severe_concussion_injury"
	}
];
gt.Const.Injury.Helping <- [
	{
		ID = "injury.sprained_ankle",
		Threshold = 0.25,
		Script = "injury/sprained_ankle_injury"
	},
	{
		ID = "injury.smashed_hand",
		Threshold = 0.5,
		Script = "injury/smashed_hand_injury"
	},
	{
		ID = "injury.crushed_finger",
		Threshold = 0.25,
		Script = "injury/crushed_finger_injury"
	}
];
gt.Const.Injury.Archery <- [
	{
		ID = "injury.split_nose",
		Threshold = 0.25,
		Script = "injury/split_nose_injury"
	},
	{
		ID = "injury.grazed_eye_socket",
		Threshold = 0.5,
		Script = "injury/grazed_eye_socket_injury"
	},
	{
		ID = "injury.missing_eye",
		Threshold = 0.25,
		Script = "injury_permanent/missing_eye_injury"
	},
	{
		ID = "injury.brain_damage",
		Threshold = 0.25,
		Script = "injury_permanent/brain_damage_injury"
	}
];
gt.Const.Injury.Jousting <- [
	{
		ID = "injury.injured_shoulder",
		Threshold = 0.25,
		Script = "injury/injured_shoulder_injury"
	},
	{
		ID = "injury.pierced_chest",
		Threshold = 0.25,
		Script = "injury/pierced_chest_injury"
	},
	{
		ID = "injury.pierced_arm_muscles",
		Threshold = 0.25,
		Script = "injury/pierced_arm_muscles_injury"
	},
	{
		ID = "injury.dislocated_shoulder",
		Threshold = 0.5,
		Script = "injury/dislocated_shoulder_injury"
	}
];
gt.Const.Injury.Brawl <- [
	{
		ID = "injury.fractured_hand",
		Threshold = 0.25,
		Script = "injury/fractured_hand_injury"
	},
	{
		ID = "injury.fractured_ribs",
		Threshold = 0.25,
		Script = "injury/fractured_ribs_injury"
	},
	{
		ID = "injury.crushed_finger",
		Threshold = 0.25,
		Script = "injury/crushed_finger_injury"
	},
	{
		ID = "injury.fractured_elbow",
		Threshold = 0.25,
		Script = "injury/fractured_elbow_injury"
	},
	{
		ID = "injury.sprained_ankle",
		Threshold = 0.25,
		Script = "injury/sprained_ankle_injury"
	},
	{
		ID = "injury.dislocated_shoulder",
		Threshold = 0.5,
		Script = "injury/dislocated_shoulder_injury"
	},
	{
		ID = "injury.injured_shoulder",
		Threshold = 0.25,
		Script = "injury/injured_shoulder_injury"
	},
	{
		ID = "injury.broken_nose",
		Threshold = 0.25,
		Script = "injury/broken_nose_injury"
	},
	{
		ID = "injury.ripped_ear",
		Threshold = 0.25,
		Script = "injury/ripped_ear_injury"
	},
	{
		ID = "injury.grazed_eye_socket",
		Threshold = 0.5,
		Script = "injury/grazed_eye_socket_injury"
	}
];
gt.Const.Injury.Mountains <- [
	{
		ID = "injury.fractured_hand",
		Threshold = 0.25,
		Script = "injury/fractured_hand_injury"
	},
	{
		ID = "injury.fractured_ribs",
		Threshold = 0.25,
		Script = "injury/fractured_ribs_injury"
	},
	{
		ID = "injury.crushed_finger",
		Threshold = 0.25,
		Script = "injury/crushed_finger_injury"
	},
	{
		ID = "injury.fractured_elbow",
		Threshold = 0.25,
		Script = "injury/fractured_elbow_injury"
	},
	{
		ID = "injury.sprained_ankle",
		Threshold = 0.25,
		Script = "injury/sprained_ankle_injury"
	},
	{
		ID = "injury.dislocated_shoulder",
		Threshold = 0.5,
		Script = "injury/dislocated_shoulder_injury"
	},
	{
		ID = "injury.broken_nose",
		Threshold = 0.25,
		Script = "injury/broken_nose_injury"
	},
	{
		ID = "injury.bruised_leg",
		Threshold = 0.25,
		Script = "injury/bruised_leg_injury"
	}
];
gt.Const.Injury.Knockout <- [
	{
		ID = "injury.broken_nose",
		Threshold = 0.25,
		Script = "injury/broken_nose_injury"
	},
	{
		ID = "injury.grazed_eye_socket",
		Threshold = 0.5,
		Script = "injury/grazed_eye_socket_injury"
	}
];
gt.Const.Injury.SkeletonHead <- [
	{
		ID = "injury.broken_nose",
		Threshold = 0.25,
		Script = "injury/broken_nose_injury"
	},
	{
		ID = "injury.fractured_skull",
		Threshold = 0.6,
		Script = "injury/fractured_skull_injury"
	},
	{
		ID = "injury.grazed_eye_socket",
		Threshold = 0.5,
		Script = "injury/grazed_eye_socket_injury"
	},
	{
		ID = "injury.severe_concussion",
		Threshold = 0.5,
		Script = "injury/severe_concussion_injury"
	}
];
gt.Const.Injury.SkeletonBody <- [
	{
		ID = "injury.dislocated_shoulder",
		Threshold = 0.5,
		Script = "injury/dislocated_shoulder_injury"
	},
	{
		ID = "injury.fractured_hand",
		Threshold = 0.25,
		Script = "injury/fractured_hand_injury"
	},
	{
		ID = "injury.fractured_ribs",
		Threshold = 0.25,
		Script = "injury/fractured_ribs_injury"
	},
	{
		ID = "injury.crushed_finger",
		Threshold = 0.25,
		Script = "injury/crushed_finger_injury"
	},
	{
		ID = "injury.fractured_elbow",
		Threshold = 0.25,
		Script = "injury/fractured_elbow_injury"
	},
	{
		ID = "injury.sprained_ankle",
		Threshold = 0.25,
		Script = "injury/sprained_ankle_injury"
	},
	{
		ID = "injury.injured_knee_cap",
		Threshold = 0.5,
		Script = "injury/injured_knee_cap_injury"
	},
	{
		ID = "injury.injured_shoulder",
		Threshold = 0.25,
		Script = "injury/injured_shoulder_injury"
	},
	{
		ID = "injury.exposed_ribs",
		Threshold = 0.35,
		Script = "injury/exposed_ribs_injury"
	},
	{
		ID = "injury.maimed_foot",
		Threshold = 0.75,
		Script = "injury_permanent/maimed_foot_injury"
	},
	{
		ID = "injury.smashed_hand",
		Threshold = 0.5,
		Script = "injury/smashed_hand_injury"
	}
];
gt.Const.Injury.FeedDog <- [
	{
		ID = "injury.split_hand",
		Threshold = 0.25,
		Script = "injury/split_hand_injury"
	},
	{
		ID = "injury.crushed_finger",
		Threshold = 0.25,
		Script = "injury/crushed_finger_injury"
	},
	{
		ID = "injury.split_hand",
		Threshold = 0.25,
		Script = "injury/split_hand_injury"
	},
	{
		ID = "injury.crushed_finger",
		Threshold = 0.25,
		Script = "injury/crushed_finger_injury"
	},
	{
		ID = "injury.missing_finger",
		Threshold = 0.25,
		Script = "injury_permanent/missing_finger_injury"
	}
];
gt.Const.Injury.DogBrawl <- [
	{
		ID = "injury.split_hand",
		Threshold = 0.25,
		Script = "injury/split_hand_injury"
	},
	{
		ID = "injury.crushed_finger",
		Threshold = 0.25,
		Script = "injury/crushed_finger_injury"
	},
	{
		ID = "injury.split_hand",
		Threshold = 0.25,
		Script = "injury/split_hand_injury"
	},
	{
		ID = "injury.crushed_finger",
		Threshold = 0.25,
		Script = "injury/crushed_finger_injury"
	},
	{
		ID = "injury.missing_finger",
		Threshold = 0.25,
		Script = "injury_permanent/missing_finger_injury"
	},
	{
		ID = "injury.pierced_leg_muscles",
		Threshold = 0.25,
		Script = "injury/pierced_leg_muscles_injury"
	},
	{
		ID = "injury.sprained_ankle",
		Threshold = 0.25,
		Script = "injury/sprained_ankle_injury"
	},
	{
		ID = "injury.cut_arm_sinew",
		Threshold = 0.25,
		Script = "injury/cut_arm_sinew_injury"
	}
];
gt.Const.Injury.Accident1 <- [
	{
		ID = "injury.crushed_finger",
		Threshold = 0.25,
		Script = "injury/crushed_finger_injury"
	},
	{
		ID = "injury.sprained_ankle",
		Threshold = 0.25,
		Script = "injury/sprained_ankle_injury"
	},
	{
		ID = "injury.broken_nose",
		Threshold = 0.25,
		Script = "injury/broken_nose_injury"
	},
	{
		ID = "injury.pierced_hand",
		Threshold = 0.25,
		Script = "injury/pierced_hand_injury"
	},
	{
		ID = "injury.injured_knee_cap",
		Threshold = 0.5,
		Script = "injury/injured_knee_cap_injury"
	},
	{
		ID = "injury.pierced_leg_muscles",
		Threshold = 0.25,
		Script = "injury/pierced_leg_muscles_injury"
	},
	{
		ID = "injury.fractured_hand",
		Threshold = 0.25,
		Script = "injury/fractured_hand_injury"
	},
	{
		ID = "injury.dislocated_shoulder",
		Threshold = 0.5,
		Script = "injury/dislocated_shoulder_injury"
	},
	{
		ID = "injury.cut_arm_sinew",
		Threshold = 0.25,
		Script = "injury/cut_arm_sinew_injury"
	},
	{
		ID = "injury.fractured_ribs",
		Threshold = 0.25,
		Script = "injury/fractured_ribs_injury"
	},
	{
		ID = "injury.split_nose",
		Threshold = 0.25,
		Script = "injury/split_nose_injury"
	},
	{
		ID = "injury.injured_shoulder",
		Threshold = 0.25,
		Script = "injury/injured_shoulder_injury"
	},
	{
		ID = "injury.split_hand",
		Threshold = 0.5,
		Script = "injury/split_hand_injury"
	},
	{
		ID = "injury.split_shoulder",
		Threshold = 0.5,
		Script = "injury/split_shoulder_injury"
	}
];
gt.Const.Injury.Accident2 <- [
	{
		ID = "injury.pierced_hand",
		Threshold = 0.25,
		Script = "injury/pierced_hand_injury"
	},
	{
		ID = "injury.pierced_leg_muscles",
		Threshold = 0.25,
		Script = "injury/pierced_leg_muscles_injury"
	},
	{
		ID = "injury.pierced_chest",
		Threshold = 0.25,
		Script = "injury/pierced_chest_injury"
	},
	{
		ID = "injury.pierced_arm_muscles",
		Threshold = 0.25,
		Script = "injury/pierced_arm_muscles_injury"
	},
	{
		ID = "injury.pierced_lung",
		Threshold = 0.5,
		Script = "injury/pierced_lung_injury"
	}
];
gt.Const.Injury.Accident3 <- [
	{
		ID = "injury.broken_nose",
		Threshold = 0.25,
		Script = "injury/broken_nose_injury"
	},
	{
		ID = "injury.severe_concussion",
		Threshold = 0.5,
		Script = "injury/severe_concussion_injury"
	},
	{
		ID = "injury.grazed_eye_socket",
		Threshold = 0.5,
		Script = "injury/grazed_eye_socket_injury"
	}
];
gt.Const.Injury.Accident4 <- [
	{
		ID = "injury.cut_arm_sinew",
		Threshold = 0.25,
		Script = "injury/cut_arm_sinew_injury"
	},
	{
		ID = "injury.cut_arm",
		Threshold = 0.25,
		Script = "injury/cut_arm_injury"
	},
	{
		ID = "injury.split_shoulder",
		Threshold = 0.5,
		Script = "injury/split_shoulder_injury"
	}
];
gt.Const.Injury.PiercedArm <- [
	{
		ID = "injury.injured_shoulder",
		Threshold = 0.25,
		Script = "injury/injured_shoulder_injury"
	},
	{
		ID = "injury.pierced_arm_muscles",
		Threshold = 0.25,
		Script = "injury/pierced_arm_muscles_injury"
	}
];
gt.Const.Injury.Cannibal <- [
	{
		ID = "injury.missing_nose",
		Script = "injury_permanent/missing_nose_injury"
	},
	{
		ID = "injury.missing_eye",
		Script = "injury_permanent/missing_eye_injury"
	},
	{
		ID = "injury.missing_ear",
		Script = "injury_permanent/missing_ear_injury"
	},
	{
		ID = "injury.missing_finger",
		Script = "injury_permanent/missing_finger_injury"
	},
	{
		ID = "injury.missing_hand",
		Script = "injury_permanent/missing_hand_injury"
	}
];
gt.Const.Injury.CampTraining <- [
	{
		ID = "injury.fractured_hand",
		Threshold = 0.25,
		Script = "injury/fractured_hand_injury"
	},
	{
		ID = "injury.fractured_ribs",
		Threshold = 0.25,
		Script = "injury/fractured_ribs_injury"
	},
	{
		ID = "injury.crushed_finger",
		Threshold = 0.25,
		Script = "injury/crushed_finger_injury"
	},
	{
		ID = "injury.fractured_elbow",
		Threshold = 0.25,
		Script = "injury/fractured_elbow_injury"
	},
	{
		ID = "injury.sprained_ankle",
		Threshold = 0.25,
		Script = "injury/sprained_ankle_injury"
	},
	{
		ID = "injury.bruised_leg",
		Threshold = 0.25,
		Script = "injury/bruised_leg_injury"
	},
	{
		ID = "injury.dislocated_shoulder",
		Threshold = 0.5,
		Script = "injury/dislocated_shoulder_injury"
	},
	{
		ID = "injury.broken_arm",
		Threshold = 0.5,
		Script = "injury/broken_arm_injury"
	},
	{
		ID = "injury.smashed_hand",
		Threshold = 0.5,
		Script = "injury/smashed_hand_injury"
	},
	{
		ID = "injury.broken_ribs",
		Threshold = 0.5,
		Script = "injury/broken_ribs_injury"
	},
	{
		ID = "injury.broken_leg",
		Threshold = 0.5,
		Script = "injury/broken_leg_injury"
	},
	{
		ID = "injury.broken_nose",
		Threshold = 0.25,
		Script = "injury/broken_nose_injury"
	},
	{
		ID = "injury.severe_concussion",
		Threshold = 0.5,
		Script = "injury/severe_concussion_injury"
	},
	{
		ID = "injury.split_hand",
		Threshold = 0.5,
		Script = "injury/split_hand_injury"
	},
	{
		ID = "injury.cut_arm",
		Threshold = 0.25,
		Script = "injury/cut_arm_injury"
	},
	{
		ID = "injury.ripped_ear",
		Threshold = 0.25,
		Script = "injury/ripped_ear_injury"
	},
	{
		ID = "injury.split_nose",
		Threshold = 0.25,
		Script = "injury/split_nose_injury"
	},
	{
		ID = "injury.pierced_cheek",
		Threshold = 0.25,
		Script = "injury/pierced_cheek_injury"
	},
	{
		ID = "injury.grazed_neck",
		Threshold = 0.25,
		Script = "injury/grazed_neck_injury"
	},
	{
		ID = "injury.injured_shoulder",
		Threshold = 0.25,
		Script = "injury/injured_shoulder_injury"
	},
	{
		ID = "injury.pierced_hand",
		Threshold = 0.25,
		Script = "injury/pierced_hand_injury"
	},
	{
		ID = "injury.injured_knee_cap",
		Threshold = 0.5,
		Script = "injury/injured_knee_cap_injury"
	}
];

