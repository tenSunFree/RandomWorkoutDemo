struct LiveModel {
    let liveBeanList = [
        LiveBean(title: "只見她一張瓜子臉，頗為俏麗，年紀似尚比他小著一兩歲。", image: "girl01.jpeg"),
        LiveBean(title: "回眸一笑百魅生，六宮粉黛無顏色。", image: "girl02.jpeg"),
        LiveBean(title: "只見她膚色白潤，雙頰暈紅，兩眼水汪汪的斜睨他。", image: "girl03.jpeg"),
        LiveBean(title: "梨花一枝春帶雨。", image: "girl04.jpeg"),
        LiveBean(title: "絕代有佳人，幽居在空谷。", image: "girl05.png"),
        LiveBean(title: "借問漢宮誰得似？可憐飛燕倚新妝。", image: "girl06.jpeg"),
        LiveBean(title: "清水出芙蓉，天然去雕飾。", image: "girl07.jpeg"),
        LiveBean(title: "腮凝新荔，鼻膩鵝脂，溫柔沉默，觀之可親。", image: "girl08.jpeg"),
    ]
    
    func getLiveBeanList() -> [LiveBean] {
        return liveBeanList
    }
}

struct LiveBean: Hashable {
    let title: String
    let image: String
}
