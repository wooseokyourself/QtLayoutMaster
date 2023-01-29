import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Layouts 1.14
import QtQuick.Controls 2.14

Window {
  visible: true
  width: 640
  height: 480
  title: qsTr("Hello World")
  
  Pane { id: redtangle
    background: Rectangle {color: "Red"}
  }

  FreeLayoutItem { id: item
    content: Rectangle {
      color: "Red"
    } // Rectangle
  } // FreeLayoutItem
  
  Component { id: redButtonComponent
    FreeLayoutItem { 
      content: Rectangle {
        color: "Red"
      } // Rectangle
    } // FreeLayoutItem
  } // Component
  
  Pane { anchors.fill: parent
    ColumnLayout { anchors.fill: parent
      FreeLayoutSpace { id: freeLayoutSpace
        Layout.fillWidth: true; Layout.fillHeight: true
        orientation: Qt.Horizontal
      } // FreeLayoutSpace
      Button {
        text: "add red"
        // onClicked: freeLayoutSpace.addItem("RED", redButtonComponent.createObject()) 
        onClicked: freeLayoutSpace.addItem("RED", item) 
      } // Button
      SplitView { Layout.fillWidth: true; Layout.preferredHeight: parent.height / 2
        FreeLayoutItem { 
          content: Rectangle {
            color: "Red"
          } // Rectangle
        } // FreeLayoutItem
        FreeLayoutItem { 
          content: Rectangle {
            color: "Red"
          } // Rectangle
        } // FreeLayoutItem
      } // SplitView
    } // ColumnLayout
  } // Pane
  

  
  
  

} // Window
