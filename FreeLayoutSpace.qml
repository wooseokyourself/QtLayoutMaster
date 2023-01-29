import QtQuick 2.14
import QtQuick.Layouts 1.14
import QtQuick.Controls 2.14

Pane {
	property alias orientation: splitView.orientation
	function addItem(text, item) {
		var element = component.createObject(null, {"headerText": text, "content": item})
		splitView.addItem(element)
		element.content = item
	}
	Binding {
		target: loader
	}
	background: Rectangle { color: "Blue" }
	Component { id: component	
		Pane {
			property alias headerText: headerText.text
			property alias content: loader.sourceComponent
			SplitView.fillWidth: true; SplitView.fillHeight: true
			ColumnLayout { anchors.fill: parent
				Pane { Layout.fillWidth: true
					RowLayout { anchors.fill: parent
						Label { id: headerText } // Label
						RoundButton { Layout.alignment: Qt.AlignRight
							text: "X"
						} // RoundButton
					} // RowLayout
				} // Pane
				Loader { id: loader
					Layout.fillWidth: true; Layout.fillHeight: true
					sourceComponent: Pane {
						background: Rectangle { color: "Green" }
					}
				} // Loader
			} // ColumnLayout
		} // Pane
		
	} // Component
	SplitView { id: splitView
		anchors.fill: parent
		
		
	} // SplitView
} // Pane
