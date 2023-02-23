import Foundation

enum SkillLevel: Comparable {
    case beginner
    case intermediate
    case expert(stars: Int)
}

var levels = [SkillLevel.intermediate,
              SkillLevel.beginner,
              SkillLevel.expert(stars: 5),
              SkillLevel.expert(stars: 3)]

if SkillLevel.intermediate > SkillLevel.beginner {
    print("intermediate is higher level than beginner")
}

for level in levels.sorted() {
    print(level)
}
