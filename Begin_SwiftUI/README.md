# SwiftUI Basic
---

### HStack vs VStack vs ZStack
> HStack -> horizontal surface

> VStack -> vertical surface

> ZStack -> over lap everything the surface

### State Variable, tap gesture
> .offset -> it can set the Text() any location 

> .onTapGesture -> Adds an action to perform when this view recognizes a tap gesture. 

> @State ->  allow us to modify values inside a struct

### Example Button 
```Swift
    @State var controlOF: Bool = true

            Button(action: {
                withAnimation{
                    controlOF.toggle()
                }
            }, label: {
                Text("Click me")
                    .font(.largeTitle)
                    .foregroundColor(.black)
            })
```

### Animation
> Pass

###