//
//  GeneralView.swift
//  LinearMouse
//
//  Created by lujjjh on 2021/7/30.
//

import SwiftUI

struct GeneralView: View {
    @ObservedObject var defaults = AppDefaults.shared

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Spacer()

            VStack(alignment: .leading) {
                Toggle(isOn: $defaults.reverseScrollingVerticallyOn) {
                    VStack(alignment: .leading) {
                        HStack(alignment: .firstTextBaseline, spacing: 2) {
                            Text("Reverse scrolling")
                            Text("(vertically)")
                                .controlSize(.small)
                                .foregroundColor(.secondary)
                        }
                        Text("""
                            Reverse the scroll direction for a mouse \
                            but won't reverse the scroll direction \
                            for a Trackpad.
                            """)
                            .controlSize(.small)
                            .foregroundColor(.secondary)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
            }

            VStack(alignment: .leading) {
                Toggle(isOn: $defaults.reverseScrollingHorizontallyOn) {
                    VStack(alignment: .leading) {
                        HStack(alignment: .firstTextBaseline, spacing: 2) {
                            Text("Reverse scrolling")
                            Text("(horizontally)")
                                .controlSize(.small)
                                .foregroundColor(.secondary)
                        }
                        Text("""
                            Some gestures, such as swiping back and forward, \
                            may stop working.
                            """)
                            .controlSize(.small)
                            .foregroundColor(.secondary)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
            }

            Toggle(isOn: $defaults.linearScrollingOn) {
                VStack(alignment: .leading) {
                    Text("Enable linear scrolling")
                    Text("""
                        Disable mouse scrolling acceleration.
                        """)
                        .controlSize(.small)
                        .foregroundColor(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            HStack {
                Text("Scroll")
                Stepper(
                    value: $defaults.scrollLines,
                    in: 1...10,
                    step: 1) {
                    Text(String(defaults.scrollLines))
                }
                Text(defaults.scrollLines == 1 ? "line" : "lines")
            }
            .controlSize(.small)
            .padding(.leading, 18)
            .padding(.top, -20)
            .disabled(!defaults.linearScrollingOn)

            Toggle(isOn: $defaults.universalBackForwardOn) {
                VStack(alignment: .leading) {
                    Text("Enable universal back and forward")
                    Text("""
                        Convert the back and forward side buttons to \
                        swiping gestures to allow universal back and \
                        forward functionality.
                        """)
                        .controlSize(.small)
                        .foregroundColor(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }

            Toggle(isOn: $defaults.showInMenuBar) {
                VStack(alignment: .leading) {
                    Text("Show in menu bar")
                    Text("""
                        To show the preferences, launch \
                        \(LinearMouse.appName) again.
                        """)
                        .controlSize(.small)
                        .foregroundColor(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }

            Spacer()

            VStack(alignment: .leading) {
                CheckForUpdatesView()

                Spacer()

                HStack {
                    HyperLink(URL(string: "https://linearmouse.org")!) {
                        Text("Homepage")
                    }
                    HyperLink(URL(string: "https://github.com/linearmouse/linearmouse")!) {
                        Text("GitHub")
                    }
                    HyperLink(URL(string: "https://github.com/linearmouse/linearmouse/issues")!) {
                        Text("Feedback")
                    }
                    HyperLink(URL(string: "mailto:feedback@linearmouse.org")!) {
                        Text("Contact")
                    }
                }
                .controlSize(.small)
                .foregroundColor(.secondary)
            }

            Spacer()
        }
        .padding(20)
        .frame(width: 400)
    }
}

struct GeneralView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralView()
    }
}
