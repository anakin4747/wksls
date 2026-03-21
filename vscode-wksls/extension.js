'use strict';

const { LanguageClient, TransportKind } = require('vscode-languageclient/node');

/** @type {LanguageClient | undefined} */
let client;

/**
 * @param {import('vscode').ExtensionContext} _context
 */
function activate(_context) {
    /** @type {import('vscode-languageclient/node').ServerOptions} */
    const serverOptions = {
        command: 'wksls',
        transport: TransportKind.stdio,
    };

    /** @type {import('vscode-languageclient/node').LanguageClientOptions} */
    const clientOptions = {
        documentSelector: [{ scheme: 'file', language: 'wks' }],
    };

    client = new LanguageClient('wksls', 'WKS Language Server', serverOptions, clientOptions);
    client.start();
}

function deactivate() {
    if (!client) return undefined;
    return client.stop();
}

module.exports = { activate, deactivate };
