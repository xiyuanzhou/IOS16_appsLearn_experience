# ***IOS16_appsLearn_experience***
***

### __Adding a View__
> Struct and Array of Structs

> (Example!!!)
```Swift
    struct DataItemModel {
        let text: String
        let color: Color
        
    }

    let messages = [
        DataItemModel(text: "Hello there", color: .red),
        DataItemModel(text: "Hello there", color: .blue),
        DataItemModel(text: "Hello there", color: .black),
        DataItemModel(text: "Hello there", color: .green),
        DataItemModel(text: "Hello there", color: .pink)
    ]

    //This is how it use the struct function
    TextView(text: messages[0].text, color: messages[0].color)

    //Struct function
    struct TextView: View {
        let text: String
        let color: Color
        
        var body: some View {
            Text(text)
                .font(.title)
                .font(.largeTitle)
                .foregroundColor(Color.white)
                .background(color.opacity(0.4))
                .cornerRadius(5.0)
                .shadow(color: color, radius: 5,x: 5, y: 5)
            
                .padding(0.5)
        }
    }
```


