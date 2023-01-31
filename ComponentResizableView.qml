import QtQuick 2.14
import QtQuick.Layouts 1.14
import QtQuick.Controls 2.14

Pane { id: root
	//function addComponent(component) {
	//	listModel.append( {component} )
	//}
	background: Rectangle { color: "black" }
	function addObject(object) {
		// object.parent = splitView
		contentChildren.push(object)
	}
	MouseArea { anchors.fill: parent
		property int index: -1
		property string activePolicy: "null"
		// l, r, t, b, lt, lb, rt, rb
		// onClicked: mouse.accepted = false
		onDoubleClicked: mouse.accepted = false
		onPressAndHold: mouse.accepted = false
		onPressed: {
			console.log("pressed, active=" + activePolicy + ", model=" + contentChildren.length)
			if (activePolicy == "null") {
				for (var i = contentChildren.length - 1; i >= 0; i--) {
					const x = mouseX
					const y = mouseY
					const item = contentChildren[i]
					const left = item.x
					const right = left + item.width
					const top = item.y
					const bottom = top + item.height
					console.log(x + ", " + y + ", " + left + ", " + right + ", " + top + ", " + bottom)
					if (((x > left - 20 && x < left + 20) && (y > top && y < bottom))) {
						activePolicy = "l"
						console.log("change policy: l")
					}
					else if (((x > right - 20 && x < right + 20) && (y > top && y < bottom))) {
						activePolicy = "r"
						console.log("change policy: r")
					}
					else if (((y > top - 20 && y < top + 20) && (x > left && x < right))) {
						activePolicy = "t"
					}
					else if (((y > bottom - 20 && y < bottom + 20) && (x >= left && x <= right))) {
						activePolicy = "b"
					}
					else if ((x > left - 20 && x < left + 20) && (y > top - 20 && y < top + 20)) { activePolicy = "lt" }
					else if ((x > left - 20 && x < left + 20) && (y > bottom - 20 && y < bottom + 20)) { activePolicy = "lb" }
					else if ((x > right - 20 && x < right + 20) && (y > top - 20 && y < top + 20)) { activePolicy = "rt" }
					else if ((x > right - 20 && x < right + 20) && (y > bottom - 20 && y < bottom + 20)) { activePolicy = "rb" }
					if (activePolicy != "null") {
						index = i
						break
					}
				}
				if (activePolicy == "null") mouse.accepted = false
			}
			else {
				mouse.accepted = false
			}
		}
		onReleased: {
			if (activePolicy != "null") {
				activePolicy = "null"
				index = -1
			}
			else {
				mouse.accepted = false
			}
		}
		// onWeheel: wheel.accepted = false
		onMouseXChanged: {
			if (activePolicy != "null") {
				const x = mouseX
				var item = contentChildren[index]

				if (activePolicy == "l" || activePolicy == "lt" || activePolicy == "lb") {
					const delta = x - item.x
					if (item.width - delta > 50 
						&& item.x + delta > root.leftPadding) {
						item.x += delta
						item.width -= delta
					}
				}
				else if (activePolicy == "r" || activePolicy == "rt" || activePolicy == "rb") {
					const delta = x - (item.x + item.width)
					if (item.width + delta > 50
						&& item.x + item.width + delta < root.width - root.rightPadding) {
						item.width += delta
					}
				}
				/*
				else if (activePolicy == "t") {
					const delta = y - listModel[index].y
					listModel[index].y += delta
					listModel[index].height -= delta
				}
				else if (activePolicy == "b") {
					const delta = y - (listModel[index].y + listModel[index].height)
					listModel[index].height += delta
				}
				*/
			}
		} // onMouseXChanged

		onMouseYChanged: {
			if (activePolicy != "null") {
				const y = mouseY
				var item = contentChildren[index]
				console.log("tb=" + root.topPadding + "," + root.bottomPadding)
				var itemBottom = item.y + item.height
				var pageBottom = root.height - root.bottomPadding
				console.log("item bottom=" + itemBottom)
				console.log("pane bottom=" + pageBottom)
				if (activePolicy == "t" || activePolicy == "lt" || activePolicy == "rt") {
					const delta = y - item.y
					if (item.height - delta > 50 
						//&& item.y + delta > root.topPadding) {
						){
						item.y += delta
						item.height -= delta
					}
				}
				else if (activePolicy == "b" || activePolicy == "lb" || activePolicy == "rb") {
					const delta = y - (item.y + item.height)
					if (item.height + delta > 50
						// && item.y + item.height + delta < root.height - root.bottomPadding) {
						){	item.height += delta
						}
				}
				if (item.y < root.topPadding) {
					const diff = root.topPadding - item.y
					item.y = root.topPadding
					item.height -= diff;
				}
				else if (item.y + item.height > root.height - root.bottomPadding ) {
					const diff = (item.y + item.height) - (root.height - root.bottomPadding)
					item.height -= diff;
				}
				/*
				else if (activePolicy == "t") {
					const delta = y - listModel[index].y
					listModel[index].y += delta
					listModel[index].height -= delta
				}
				else if (activePolicy == "b") {
					const delta = y - (listModel[index].y + listModel[index].height)
					listModel[index].height += delta
				}
				*/
			}
		} // onMouseYChanged

	} // MouseArea
	
} // Pane
