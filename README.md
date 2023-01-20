# ***IOS16_appsLearn_experience***
***

> 'onTapGesture' is like a (click event)

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
> Break

### __Simplifying code uisng ForEach__
> ForEach methods
```Swift
//messages is the list
//TextView is the struct function

//using ForEach() take list and execute each one in the list
    let messages = [
        DataItemModel(text: "Hello there!", color: .red),
        DataItemModel(text: "Welcome to Swift programming", color: .black),
        DataItemModel(text: "Are you Ready?", color: .blue),
        DataItemModel(text: "Start Exploring?", color: .green),
        DataItemModel(text: "BOOM!!", color: .pink)
    ]
    
    var body: some View {
        ForEach(messages, content: { dataItem in
            TextView(text: dataItem.text, color: dataItem.color)
        })
        //another way to write (ForEach)
        ForEach(0..<messages.count, content:{
            index in TextView(text: messages[index].text, color: messages[index].color)
        })
    }
```
> Break

### __ZStack.Body.Background__
> changing background color EXAMPLE
```Swift
        LinearGradient(colors: [.red,
                                .yellow,
                                .blue,
                                .yellow,
                                Color(red: 139/255,
                                      green: 80/255,
                                      blue: 240/255
                                     )],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .opacity(0.4).ignoresSafeArea()
```
> Break

### __Randomly change color__
> 
```Swift
    @State var color: Color
    
    let colors: [Color] = [
        .pink,
        .black,
        .yellow,
        .blue,
        .red,
        Color(red: 0.4, green: 0.5, blue: 0.7)
    
    ]
    
    var body: some View {
        Text(text)
            .font(.title)
            .font(.largeTitle)
            .foregroundColor(Color.white)
            .background(color.opacity(0.4))
            .cornerRadius(5.0)
            .shadow(color: color, radius: 5,x: 5, y: 5)
            .onTapGesture{
                let length = colors.count
                let randomIndex = Int.random(in: 0..<length)
                color = colors[randomIndex]
            }
            .padding(0.5)
    }
```
> Break

### __Rotation animation of Circle__
> @State Variables
```Swift
    @State var isRotated: Bool = false

            Circle()
                .strokeBorder(AngularGradient(gradient: Gradient(colors:[.blue,.red,.green]), center: .center, angle: .zero),
                              lineWidth:15)
                .rotationEffect(isRotated ? .zero : .degrees(360))
                .frame(maxWidth: 70, maxHeight: 70)
                .onTapGesture {
                    withAnimation(){
                        isRotated.toggle()
                    }
                }
```
> Break

### Dark mode
```Swift

    @State var tf: Bool = false

    //set if (tf) is true, dark mode on
    //else orignal mode
    BackgroundBodyView()
        .preferredColorScheme(tf ? .dark: nil)

    Text("Dark Mode")
        .padding()
        .multilineTextAlignment(.center)
        .foregroundColor(.white)
        .background(.black)
        .cornerRadius(15)
        //trigger dark mode on/off
        .onTapGesture{
            tf.toggle()
        }
```
> Break

### Launch Screen
> XXXXX



