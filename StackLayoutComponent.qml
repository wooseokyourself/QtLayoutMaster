import QtQuick 2.14
import QtQuick.Layouts 1.14
import QtQuick.Controls 2.14

Component {
	Pane { id: root; padding: 0
		function addComponent(headerText, component) {
			var button = tabButtonComponent.createObject(tab, {text: headerText})
			tab.addItem(button)
			stackModel.append( {component} )
		} // addItem
		Component { id: tabButtonComponent
      TabButton { id: tabButton; padding: 2; height: 25
				readonly property int index: TabBar.index
				Button { width: 18; height: 18; padding: 2
					anchors.right: parent.right; anchors.top: parent.top
					text: "x"
					font.pointSize: 6
					onClicked: {
						stackModel.remove(index)
						tab.removeItem(index)
					} // onClicked
				} // Button
				MouseArea {
					anchors.fill: parent
					onPressed: tabButton.checked = true
					onMouseXChanged: {
						const index = tabButton.index
						if (mouse.x <= 1 && index > 0) {
							stackModel.move(index, index - 1, 1)
							tab.moveItem(index, index - 1)
						}
						else if (mouse.x >= tabButton.width - 1 && index < stackModel.count - 1) {
							stackModel.move(index, index + 1, 1)
							tab.moveItem(index, index + 1)
						}
					} // onMouseXChanged
				} // MouseArea
			} // TabButton
    } // Component
		ColumnLayout { anchors.fill: parent
			TabBar { id: tab; Layout.fillWidth: true
				MouseArea {
					anchors.fill: parent
					onClicked: console.log("tab bar")
				}
			} // TabBar
			Pane { id: stackPanel; padding: 0
				Layout.fillWidth: true; Layout.fillHeight: true
				StackLayout { id: stack; anchors.fill: parent
					currentIndex: tab.currentIndex
					Repeater {
						model: ListModel {
							id: stackModel
						} // ListModel
						delegate: Loader { id: loader
							property var _component: component
							Layout.fillWidth: true; Layout.fillHeight: true
							sourceComponent: _component
							Component.onCompleted: sourceComponent.createObject(stack, {"width":Qt.binding(function(){stackPanel.width})})
						} // Loader
					} // Repeater
				} // StackLayout
			} // Pane

			Button { Layout.fillWidth: true
				text: "Add"
				onClicked: {
					root.addComponent("item", Math.random() < 0.9 ? rectComponent : labelComponent)
				}
			}
		} // ColumnLayout

		Component { id: rectComponent
			Rectangle { 
				color: Qt.rgba(Math.random(),Math.random(),Math.random(),1)
			} // Rectangle
		} // Component

		Component { id: labelComponent
			Label { 
				text: "Label " + Math.random()
				font.pointSize: 14
			} // Label
		} // Component
  } // Pane
} // Component