import './globals.css';
import { RainbowKitProvider, getDefaultConfig } from '@rainbow-me/rainbowkit';
import { WagmiProvider } from 'wagmi';
import { mainnet, sepolia } from 'wagmi/chains';
import '@rainbow-me/rainbowkit/styles.css';
import WalletConnectButton from '@/components/WalletConnectButton';

const config = getDefaultConfig({
  appName: 'Geo DApps Collection',
  projectId: 'YOUR_WALLET_CONNECT_ID',
  chains: [sepolia],
});

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="fr">
      <body>
        <WagmiProvider config={config}>
          <RainbowKitProvider>
            <div className="min-h-screen bg-gradient-to-br from-blue-900 to-purple-900 text-white">
              <header className="p-6 flex justify-between items-center">
                <h1 className="text-4xl font-bold">🌍 10 Geo DApps</h1>
                <WalletConnectButton />
              </header>
              {children}
            </div>
          </RainbowKitProvider>
        </WagmiProvider>
      </body>
    </html>
  );
}
